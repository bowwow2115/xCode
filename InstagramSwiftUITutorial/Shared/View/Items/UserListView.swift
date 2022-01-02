//
//  UserListView.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/10.
//

import SwiftUI
import Kingfisher

struct UserListView: View {
  
  @ObservedObject var viewModel: SearchViewModel
  @Binding var searchText: String
  
  var users: [User] {
    return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
  }
  
  var body: some View {
    ScrollView {
      LazyVStack{
        ForEach(users){ user in
          NavigationLink(
            destination: ProfileView(user: user),
            label: {
              UserCell(user: user)
                .padding(.leading)
            })
        }
      }
    }
  }
}

//struct UserListView_Previews: PreviewProvider {
//  static var previews: some View {
//    UserListView(viewModel: SearchViewModel())
//  }
//}
