//
//  ProfileViewModel.swift
//  InstagramSwiftUITutorial (iOS)
//
//  Created by 박승훈 on 2021/10/19.
//

import Foundation

class ProfileViewModel: ObservableObject {
  @Published var user: User
  
  init(user: User) {
    self.user = user
    checkIfUserIsFollowed()
  }
  
  func follow() {
    guard let uid = user.id else { return }
    UserService.follow(uid: uid) { _ in
      self.user.isFollowed = true
    }
  }
  
  func unfollow(){
    guard let uid = user.id else { return }
    UserService.unfollow(uid: uid){ _ in
      self.user.isFollowed = false
    }
  }
  
  func checkIfUserIsFollowed() {
    guard !user.isCurrentUser else { return }
    guard let uid = user.id else { return }
    UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
      self.user.isFollowed = isFollowed
    }
  }
}
