//
//  CustomSecureField.swift
//  InstagramSwiftUITutorial (iOS)
//
//  Created by 박승훈 on 2021/10/11.


import SwiftUI

struct CustomSecureField: View {

  @Binding var text: String
  let placeholder: Text
  
  
    var body: some View {
      ZStack(alignment: .leading){
        if text.isEmpty {
          placeholder
            .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
            .padding(.leading, 40)
        }
        
        HStack {
          Image(systemName: "lock")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .foregroundColor(.white)
          
          SecureField("", text: $text)
        }
      }
    }

}
