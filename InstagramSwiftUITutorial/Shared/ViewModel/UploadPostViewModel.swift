//
//  UploadPostViewModel.swift
//  InstagramSwiftUITutorial (iOS)
//
//  Created by 박승훈 on 2021/10/26.
//

import Foundation
import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
  
  func uploadPost(caption: String, image: UIImage, completion: FireStoreCompletion) {
    guard let user = AuthViewModel.shared.currentUser else { return }
    let currentDate = DateFormatter()
    currentDate.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let current_date_string =  currentDate.string(from: Date())
    
    ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
      let data = [ "caption": caption,
                   "timestamp": current_date_string,
                   "likes": 0,
                   "imageUrl": imageUrl,
                   "ownerUid": user.id ?? "",
                   "ownerImageUrl": user.profileImageUrl,
                   "ownerUsername": user.username] as [String : Any]
      
      COLLECTION_POSTS.addDocument(data: data, completion: completion)
      
    }
  }
}
