//
//  SearchViewModel.swift
//  InstagramSwiftUITutorial (iOS)
//
//  Created by 박승훈 on 2021/10/16.
//

import Foundation

class SearchViewModel: ObservableObject {
  @Published var users = [User]()
  
  init() {
    fetchUsers()
  }
  
  func fetchUsers(){
    COLLECTION_USERS.getDocuments { (querySnapshot, err) in
      if let err = err {
          print("Error getting documents: \(err)")
      } else {
          for document in querySnapshot!.documents {
            
//            User 객체 만들기
            let result = Result {
              try? document.data(as: User.self)
            }
            switch result {
              case .success(let user):
                if let user = user {
//                  print("DEBUG: ALL USER \(user)")
                  self.users.append(user)
                  
                }else{
                  print("DEBUG: not exist")
                }
              case .failure(let error):
                
                print("DEBUG: \(error)")
            }
            print("DEBUG: users: \(self.users)")
          }
      }
    }
    
  }
  
  func filteredUsers(_ query: String) -> [User] {
    let lowercasedQuery = query.lowercased()
    return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) ||
      $0.username.contains(lowercasedQuery)
    })
    
  }
}
