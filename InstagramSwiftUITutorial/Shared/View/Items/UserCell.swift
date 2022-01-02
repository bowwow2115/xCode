//
//  UserCell.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/10.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
  let user: User
    var body: some View {
      HStack{
        KFImage(URL(string: user.profileImageUrl))
          .resizable()
          .scaledToFill()
          .frame(width: 48, height: 48)
          .clipShape(Circle())
        
        VStack(alignment: .leading){
          Text(user.username)
            .font(.system(size: 14, weight: .semibold))
          
          Text(user.fullname)
            .font(.system(size: 14))
        }
        
        Spacer()
      }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
