//
//  BadgesBootcamp.swift
//  SwiftUIBasicBootcamp
//
//  Created by 박승훈 on 2021/12/21.
//

import SwiftUI

//List
//TabView

struct BadgesBootcamp: View {
    var body: some View {
      List {
        Text("Hello, world!!")
          .badge("New Items!")
      }
//      TabView {
//        Color.red
//          .tabItem {
//            Image(systemName: "heart.fill")
//            Text("Hello")
//          }
//          .badge(2)
//        Color.green
//          .tabItem {
//            Image(systemName: "heart.fill")
//            Text("Hello")
//          }
//        Color.blue
//          .tabItem {
//            Image(systemName: "heart.fill")
//            Text("Hello")
//          }
//      }
    }
}

struct BadgesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BadgesBootcamp()
    }
}
