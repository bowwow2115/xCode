//
//  UserCell.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/10.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
      HStack{
        Image("sasaki")
          .resizable()
          .scaledToFill()
          .frame(width: 48, height: 48)
          .clipShape(Circle())
        
        VStack(alignment: .leading){
          Text("Sasaki Aki")
            .font(.system(size: 14, weight: .semibold))
          
          Text("av actress")
            .font(.system(size: 14))
        }
        
        Spacer()
      }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
