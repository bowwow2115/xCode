//
//  HashableBootcamp.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/06.
//

import SwiftUI

struct MyCustomModel: Hashable {
  
  let id = UUID().uuidString
  let title: String
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(title)
  }
}

struct HashableBootcamp: View {
  
  let data: [MyCustomModel] = [
    MyCustomModel(title: "ONE"),
    MyCustomModel(title: "Two"),
    MyCustomModel(title: "Three"),
    MyCustomModel(title: "Four"),
    MyCustomModel(title: "Five")
  ]
  
    var body: some View {
      ScrollView {
        VStack{
          // \.self 는 Hashable구현되어야 가능(String은 가능)
          ForEach(data, id: \.self) { item in
            Text(item.title)
              .font(.headline)
          }
        }
      }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
