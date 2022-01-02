//
//  CachedBootcamp.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/18.
//

import SwiftUI

class CachedManager {
  
  static let instance = CachedManager()
  
  private init() {}
  
  var imageCached: NSCache<NSString, UIImage> = {
    let cache = NSCache<NSString, UIImage>()
    cache.countLimit = 100
    cache.totalCostLimit = 1024 * 1024 * 100
    return cache
  }()
  
  func add(image: UIImage, name: String) -> String {
    imageCached.setObject(image, forKey: name as NSString)
    return("Added to cache!")
  }
  
  func remove(name: String) -> String {
    imageCached.removeObject(forKey: name as NSString)
    return("Removed from cache")
  }
  
  func get(name: String) -> UIImage? {
    return imageCached.object(forKey: name as NSString)
  }
}

class CachedViewModel: ObservableObject {
  
  @Published var startingImage: UIImage? = nil
  @Published var cachedImage: UIImage? = nil
  @Published var infoMessage: String = ""
  
  let imageName = "eikawa"
  let manager = CachedManager.instance
  
  init() {
    getImageFromAssetsFolder()
  }
  
  func getImageFromAssetsFolder() {
    startingImage = UIImage(named: imageName)
  }
  
  func saveToCache() {
    guard let image = startingImage else { return }
    infoMessage = manager.add(image: image, name: imageName)
  }
  
  func removeFromCache() {
    infoMessage = manager.remove(name: imageName)
  }
  
  func getFromCache() {
    if let returnedImage = manager.get(name: imageName) {
      cachedImage = returnedImage
      infoMessage = "Got image from Cache"
    }else {
      cachedImage = nil
      infoMessage = "Image not found in Cache"
    }
  }
}

struct CachedBootcamp: View {
  
  @StateObject var vm = CachedViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        if let image = vm.startingImage{
          Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipped()
            .cornerRadius(10)
        }
        
        Text(vm.infoMessage)
          .font(.headline)
          .foregroundColor(.purple)
        
        HStack{
          Button(action: { vm.saveToCache() }, label: {
            Text("Save to Cached")
              .font(.headline)
              .foregroundColor(.white)
              .padding()
              .background(Color.blue)
              .cornerRadius(10)
          })
          Button(action: { vm.removeFromCache() }, label: {
            Text("Delete from Cached")
              .font(.headline)
              .foregroundColor(.white)
              .padding()
              .background(Color.red)
              .cornerRadius(10)
          })
          Button(action: { vm.getFromCache() }, label: {
            Text("Get from Cached")
              .font(.headline)
              .foregroundColor(.white)
              .padding()
              .background(Color.green)
              .cornerRadius(10)
          })
          Spacer()
        }
        
        if let image = vm.cachedImage {
          Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipped()
            .cornerRadius(10)
        }
        
      }
    }
  }
}

struct CachedBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    CachedBootcamp()
  }
}
