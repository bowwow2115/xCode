//
//  PhotoModelCacheManager.swift
//  Gestures (iOS)
//
//  Created by 박승훈 on 2021/12/19.
//

import Foundation
import UIKit

class PhotoModelCacheManager {
  
  static let instance = PhotoModelCacheManager()
  
  private init () {}
  
  var photoCache: NSCache<NSString, UIImage> = {
    var cache = NSCache<NSString, UIImage>()
    cache.countLimit = 200
    cache.totalCostLimit = 1024 * 1024 * 10
    return cache
  }()
  
  func add(key: String, value: UIImage) {
    photoCache.setObject(value, forKey: key as NSString)
  }
  
  func get(key: String) -> UIImage? {
    return photoCache.object(forKey: key as NSString)
  }
}
