//
//  Model.swift
//  TodoList (iOS)
//
//  Created by 박승훈 on 2021/11/21.
//

import Foundation

struct ItemModel: Identifiable, Codable {
  let id: String
  let title: String
  let isCompleted: Bool
  
  init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
    self.id = id
    self.title = title
    self.isCompleted = isCompleted
  }
  
  func updateCompletion() -> ItemModel {
    return ItemModel(id: id, title: title, isCompleted: !isCompleted)
  }
}

