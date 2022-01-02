//
//  AuthViewModel.swift
//  InstagramSwiftUITutorial (iOS)
//
//  Created by 박승훈 on 2021/10/11.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
  
  @Published var userSession: Firebase.User?
  @Published var currentUser: User?
  
  // session role at front
  //  MARK: initialized AuthViewModel
  static let shared = AuthViewModel()
  
  init(){
    userSession = Auth.auth().currentUser
    fetchUser()
  }
  
  func login(withEmail email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password){ result, error in
      if let error = error {
        print("DEBUG: Login failed \(error.localizedDescription)")
        return
      }
      guard let user = result?.user else { return }
      self.userSession = user
      self.fetchUser()
    }
  }
  
  func register(withEmail email: String, password: String , image: UIImage?, fullname: String, username: String) {
    
    guard let image = image else { return }
    ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
      Auth.auth().createUser(withEmail: email, password: password) { result, error in
        if let error = error {
          print(error.localizedDescription)
          return
        }
        guard let user = result?.user else { return }
        self.userSession = user
        print("Successfully registered user...")
        
        let data = ["email": email,
                    "username": username,
                    "fullname": fullname,
                    "profileImageUrl": imageUrl,
                    "uid": user.uid]
        
        COLLECTION_USERS.document(user.uid).setData(data) { _ in
          print("Successfully upload user data...")
          self.userSession = user
          self.fetchUser()
        }
      }
    }
    
  }
  
  func signout() {
    //    for front
    self.userSession = nil
    //    for back
    try? Auth.auth().signOut()
  }
  
  func fetchUser(){
    guard let uid = userSession?.uid else { return }
    
    COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
      let result = Result {
        try? snapshot?.data(as: User.self)
      }
      switch result {
        case .success(let user):
          if let user = user {
            print("DEBUG: user logined info is")
            self.currentUser = user
            print(user)
          }else{
            print("DEBUG: not exist")
          }
        case .failure(let error):
          
          print("DEBUG: \(error)")
      }
      
    }
    
  }
  
  func resetPassword(){
    print("reset")
  }
  
  
}
