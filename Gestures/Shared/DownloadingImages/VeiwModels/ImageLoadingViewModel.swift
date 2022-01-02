//
//  ImageLoadingViewMOdel.swift
//  Gestures (iOS)
//
//  Created by 박승훈 on 2021/12/19.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
  
  @Published var image: UIImage? = nil
  @Published var isLoading: Bool = false
  
  var cancellables = Set<AnyCancellable>()
  let manager = PhotoModelCacheManager.instance
  let urlString: String
  let imageKey: String
  
  init(url: String, key: String) {
    urlString = url
    imageKey = key
    getImage()
  }
  
  func getImage() {
    if let savedImage = manager.get(key: imageKey) {
      image = savedImage
      print("getting saviedImage")
    }else {
      downloadImage()
    }
  }
  
  func downloadImage() {
    print("Downloading Image Now!!")
    isLoading = true
    guard let url = URL(string: urlString) else {
      isLoading = false
      return
    }
    
    URLSession.shared.dataTaskPublisher(for: url)
      .map { UIImage(data: $0.data) }
    //위아래 동일 로직
//      .map{ (data, response) -> UIImage? in
//        return UIImage(data: data)
//      }
      .receive(on: DispatchQueue.main)
      .sink { [weak self] (_) in
        self?.isLoading = false
      } receiveValue: { [weak self] (returnedImage) in
        guard let self = self,
              let image = returnedImage else { return }
        
        self.image = image
        //cache에 집어넣기
        self.manager.add(key: self.imageKey, value: image)
      }
      .store(in: &cancellables)
  }
}
