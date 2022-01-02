//
//  ProfileHeaderView.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/10.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
  @ObservedObject var viewModel: ProfileViewModel
  
  
    var body: some View {
      GeometryReader { geometry in
        let width = geometry.size.width
      VStack(alignment: .leading){
        
        HStack{
          KFImage(URL(string: viewModel.user.profileImageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: width/5, height: 80)
            .clipShape(Circle())
            .padding(.leading)
          
          Spacer()
          
          HStack(spacing: 16){
            UserStatView(value: 1, title: "POST")
            UserStatView(value: 1, title: "Followers")
            UserStatView(value: 1, title: "Follwings")
          
        }.padding(.trailing, 32)
          
        }
        .frame(width: width)
        
        Text(viewModel.user.fullname)
            .font(.system(size: 15, weight: .semibold))
          .padding([.leading,.top])
          Text("AV Actress")
            .font(.system(size: 15))
            .padding(.leading)
            
          
        HStack {
          
          ProfileActionButtonView(viewModel: viewModel)
          
        }
        .frame(width: width)
      }
      .frame(width: width)
        
      }
    }
}

//
//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView()
//    }
//}
