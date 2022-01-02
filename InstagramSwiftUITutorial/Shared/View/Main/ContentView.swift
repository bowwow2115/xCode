//
//  ContentView.swift
//  Shared
//
//  Created by 박승훈 on 2021/10/09.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var viewModel: AuthViewModel
  @State var selectedIndex = 0
  
    var body: some View {
      Group {
        //if not logged in show login
        if viewModel.userSession == nil {
          LoginView()
        }else{
          if let user = viewModel.currentUser {
            MainTabView(user: user, selectedIndex: $selectedIndex)
          }
        }
      }
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//      ContentView()
//    }
//}
