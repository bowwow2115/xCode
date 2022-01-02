//
//  DownloadingImagesViewModel.swift
//  Gestures (iOS)
//
//  Created by 박승훈 on 2021/12/19.
//

import Foundation
import Combine

class DownloadingImageViewModel: ObservableObject {
  
  @Published var dataArray: [PhotoModel] = []
  
  let dataService = PhotoModelDataService.instance
  var cancellables = Set<AnyCancellable>()
  
  init() {
    addSubscribers()
  }
  
  func addSubscribers() {
    dataService.$photoModels
      .sink { [weak self] (returnedPhotoModels) in
        self?.dataArray = returnedPhotoModels
      }
      .store(in: &cancellables)
  }
}
