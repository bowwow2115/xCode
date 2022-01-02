//
//  BackGroundModel.swift
//  EmojiArt (iOS)
//
//  Created by 박승훈 on 2021/11/30.
//

import Foundation

extension EmojiArtModel {
  
  enum Background {
    case blank
    case url(URL)
    case imageData(Data)
    
    var url: URL? {
      switch self {
        case .url(let url): return url
        default: return nil
      }
    }
    
    var imageData: Data? {
      switch self {
        case .imageData(let data): return data
        default: return nil
      }
    }
  }
  
}
