//
//  ProfileView.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/09.
//

import SwiftUI

struct ProfileView: View {
  let user: User
  @ObservedObject var viewModel: ProfileViewModel
  
  //값을 initialize 하지 않고 전달받은 값을 전달해 주고 싶을 때 사용
  init(user: User){
    self.user = user
    self.viewModel = ProfileViewModel(user: user)
  }
    var body: some View {
        
      VStack{
        ProfileHeaderView(viewModel: viewModel)
          
        PostGridView()
      }.padding(.top)
    }
}

