//
//  Typealias.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/10.
//

import SwiftUI

struct MovieModel {
  let title: String
  let director: String
  let count: Int
}

typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
  
  @State var item: TVModel = TVModel(title: "Title", director: "John", count: 5)
  
    var body: some View {
      Text(item.title)
      Text(item.director)
      Text("\(item.count)")
    }
}

struct Typealias_Previews: PreviewProvider {
    static var previews: some View {
        TypealiasBootcamp()
    }
}
