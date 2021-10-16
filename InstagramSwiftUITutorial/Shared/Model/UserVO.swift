//
//  User.swift
//  InstagramSwiftUITutorial (iOS)
//
//  Created by 박승훈 on 2021/10/16.
//

import FirebaseFirestoreSwiftTarget
import FirebaseFirestoreSwift

struct UserVO: Decodable {
  
  let username: String
  let email: String
  let profileImaUrl: String
  let fullname: String
  @DocumentID var id: String?
  
}
