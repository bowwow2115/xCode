//
//  UserStatView.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/10.
//

import SwiftUI

struct UserStatView: View {
  
  let value: Int
  let title: String
  
  var body: some View {
    VStack {
      Text("\(value)")
        .font(.system(size: 15, weight: .semibold))
      
      Text(title)
        .font(.system(size: 15))
    }.frame(width: 80, alignment: .center)
  }
}

//struct UserStatView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserStatView()
//    }
//}
