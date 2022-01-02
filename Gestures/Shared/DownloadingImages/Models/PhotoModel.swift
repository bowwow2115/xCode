//
//  PhotoModel.swift
//  Gestures (iOS)
//
//  Created by 박승훈 on 2021/12/19.
//

import Foundation

struct PhotoModel: Identifiable, Codable {
  
  let albumId: Int
  let id: Int
  let title: String
  let url: String
  let thumbnailUrl: String
  
}
