//
//  User.swift
//  InstagramSwiftUITutorial (iOS)
//
//  Created by 박승훈 on 2021/10/16.
//


import FirebaseFirestoreSwift

struct User: Identifiable ,Decodable {
  
  var username: String
  var email: String
  var profileImageUrl: String
  var fullname: String
  @DocumentID var id: String?
  var isFollowed: Bool? = false
  
  var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
  
}
