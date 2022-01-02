//
//  ListBootcamp.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/12.
//

import SwiftUI

struct ListBootcamp: View {
  
  @State var fruits: [String] = [
    "apple", "orange", "banana", "peach"
  ]
  @State var veggies: [String] = [
  "tomato", "potato", "lettus"
  ]
  
  var body: some View {
    List {
      Section(
        header: Text("Fruits")) {
          ForEach(fruits, id: \.self) { fruit in
            Text(fruit)
          }
          .onDelete(perform: delete)
          .onMove(perform: move)
        }
    }
//    .toolbar
//    .navigationTitle("Grocery List")
//    .navigationBarItems(
//      leading: EditButton(),
//      trailing:
//        Button("Add", action: {
//          fruits.append("CoConut")
//        })
//    )
//    .listStyle(PlainListStyle())
  }
  
  func delete(indexSet: IndexSet) {
    fruits.remove(atOffsets: indexSet)
  }
  
  func move(indices: IndexSet, newOffset: Int) {
    fruits.move(fromOffsets: indices, toOffset: newOffset)
  }
}

struct ListBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    ListBootcamp()
  }
}
