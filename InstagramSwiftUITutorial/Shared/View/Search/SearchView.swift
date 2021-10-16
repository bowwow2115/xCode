//
//  SearchView.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/09.
//

import SwiftUI

struct SearchView: View {
  @State var searchText = ""
  @State var inSearchMode = false
  
    var body: some View {
      ScrollView{
        Text("Search")
        
        SearchBar(text: $searchText, isEditing: $inSearchMode)
          .padding()
        
        ZStack{
          if inSearchMode{
            UserListView()
          }else{
            PostGridView()
          }
        }
        
      }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
