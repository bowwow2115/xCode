//
//  FeedCell.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/10.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
      
      VStack(alignment: .leading){
        
//       user info
        HStack{
          Image("sasaki")
            .resizable()
            .scaledToFill()
            .frame(width: 36, height: 36)
            .clipped()
            .cornerRadius(18)
          
          Text("joker")
            .font(.system(size: 14, weight: .semibold))
        }
        .padding([.leading, .bottom], 8)
        
        // post Image
        Image("sasaki")
          .resizable()
          .scaledToFill()
          .frame(maxHeight: 440)
          .clipped()
        
        // action buttons
        HStack(spacing: 16){
          Button(action: {}, label: {
            Image(systemName: "heart")
              .resizable()
              .scaledToFill()
              .frame(width: 28, height: 20)
              .font(.system(size:20))
              .padding(4)
              
          })
          Button(action: {}, label: {
            Image(systemName: "bubble.right")
              .resizable()
              .scaledToFill()
              .frame(width: 28, height: 20)
              .font(.system(size:20))
              .padding(4)
          })
          Button(action: {}, label: {
            Image(systemName: "paperplane")
              .resizable()
              .scaledToFill()
              .frame(width: 28, height: 20)
              .font(.system(size:20))
              .padding(4)
              
          })
        }
          .padding(.leading, 4)
          .foregroundColor(.black)
        
        //caption
        
        Text("3 likes")
          .font(.system(size: 14, weight: .semibold))
          .padding(.leading, 8)
          .padding(.bottom, 2)
        
        HStack{
          Text("eikawa")
            .font(.system(size: 14, weight: .semibold)) +
          Text("dd")
            .font(.system(size: 15))
        }
        .padding(.horizontal, 8)
        
        Text("2d")
          .font(.system(size: 14))
          .foregroundColor(.gray)
          .padding(.leading, 8)
          .padding(.top, -2)
      }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
