//
//  ProfileActionButtonView.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/10.
//

import SwiftUI

struct ProfileActionButtonView: View {
  @ObservedObject var viewModel: ProfileViewModel
  var isFollowed: Bool { return viewModel.user.isFollowed ?? false }
  
  var body: some View {
    if viewModel.user.isCurrentUser {
      Button(action: {}, label: {
        Text("Edit Profile")
          .font(.system(size: 15, weight: .semibold))
          .frame(width: 360, height: 32)
          .foregroundColor(.black)
          .overlay(
            RoundedRectangle(cornerRadius: 3)
              .stroke(Color.gray, lineWidth: 1)
          )
      })
    }else{
      HStack{
        Button(action: { isFollowed ? viewModel.unfollow() : viewModel.follow() }, label: {
          Text(isFollowed ? "Following" : "Follow")
            .font(.system(size: 15, weight: .semibold))
            .frame(width: 172, height: 32)
            .foregroundColor(isFollowed ? .black : .white)
            .background(isFollowed ? Color.white : Color.blue)
            .overlay(
              RoundedRectangle(cornerRadius: 3)
                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
            )
        }).cornerRadius(3)
        Button(action: {}, label: {
          Text("Message")
            .font(.system(size: 15, weight: .semibold))
            .frame(width: 172, height: 32)
            .foregroundColor(.black)
            .overlay(
              RoundedRectangle(cornerRadius: 3)
                .stroke(Color.gray, lineWidth: 1)
            )
        })
      }
      
    }
  }
}

//struct ProfileActionButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileActionButtonView()
//    }
//}
