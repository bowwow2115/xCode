//
//  File.swift
//  TodoList (iOS)
//
//  Created by 박승훈 on 2021/11/23.
//

import Foundation
import UIKit

class ListViewModel: ObservableObject {
  
  @Published var items: [ItemModel] = [] {
    didSet {
      saveItems()
    }
  }
  
  let itemsKey: String = "items_list"
  
  init() {
    getItems()
  }
  
  func getItems() {
    //    let newItems = [
    //      ItemModel(title: "This is the first title!", isCompleted: false),
    //      ItemModel(title: "second!", isCompleted: true),
    //      ItemModel(title: "third", isCompleted: false)
    //    ]
    //    items.append(contentsOf: newItems)
    guard
      let data = UserDefaults.standard.data(forKey: itemsKey),
        //                                                   self를 붙이는 이유는 실제 array가 아니라 Type임을jj 명시
      let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
    else { return }
    
    self.items = savedItems
  }
  
  func deleteItem(indexSet: IndexSet) {
    items.remove(atOffsets: indexSet)
  }
  
  func moveItem(from: IndexSet, to: Int) {
    items.move(fromOffsets: from, toOffset: to)
  }
  
  func addItem(title: String) {
    let newItem = ItemModel(title: title, isCompleted: false)
    items.append(newItem)
  }
  
  func updateItem(item: ItemModel) {
    
    //    if let index = items.firstIndex { (existingItem) -> Bool in
    //      return existingItem.id == item.id
    //    } {
    //
    //    }
    if let index = items.firstIndex(where: { $0.id == item.id }) {
      items[index] = item.updateCompletion()
    }
  }
  
  func saveItems() {
    if let encodedData = try? JSONEncoder().encode(items) {
      UserDefaults.standard.set(encodedData, forKey: itemsKey)
    }
  }
  
}
