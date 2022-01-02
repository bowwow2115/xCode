//
//  ListSwipeActionsBootcamp.swift
//  SwiftUIBasicBootcamp
//
//  Created by 박승훈 on 2021/12/21.
//

import SwiftUI

struct ListSwipeActionsBootcamp: View {
  
  @State var fruits: [String] = [
    "apple", "orange", "banana", "peach"
  ]
  
  var body: some View {
    List {
      ForEach(fruits, id: \.self) {
        Text($0.capitalized)
          .swipeActions(edge: .trailing,
                        allowsFullSwipe: true){
            Button("Arcive") {
              
            }
            .tint(.blue)
            Button("Junk") {
              
            }
            .tint(.red)
            Button("Save") {
              
            }
            .tint(.green)
          }
      }
      //      .onDelete(perform: delete)
    }
  }
  
  func delete(indexSet: IndexSet) {
    
  }
}

struct ListSwipeActionsBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    ListSwipeActionsBootcamp()
  }
}
