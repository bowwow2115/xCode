//
//  ProfileView.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/09.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
      VStack{
        ProfileHeaderView()
          
        PostGridView()
      }.padding(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
