//
//  LoginView.swift
//  InstagramSwiftUITutorial (iOS)
//
//  Created by 박승훈 on 2021/10/11.
//

import SwiftUI

struct LoginView: View {
  
  @State private var email = ""
  @State private var password = ""
  @EnvironmentObject var viewModel: AuthViewModel
  
  var body: some View {
    NavigationView {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [Color.purple, .blue]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        VStack {
          Image("instagram")
            .resizable()
            .scaledToFill()
            .frame(width: 220, height: 100)
            .foregroundColor(.white)
          
          //email field
          VStack {
            CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
              .padding()
              .background(Color(.init(white: 1, alpha: 0.15)))
              .cornerRadius(10)
              .foregroundColor(.white)
              .padding(.horizontal, 32)
            //password field
            CustomSecureField(text: $password, placeholder: Text("password"))
              .padding()
              .background(Color(.init(white: 1, alpha: 0.15)))
              .cornerRadius(10)
              .foregroundColor(.white)
              .padding(.horizontal, 32)
          }
          
   
          //forgot password
          HStack {
            Spacer()
            
            Button(action: {}, label: {
              Text("Forgot Password?")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white)
                .padding(.top)
                .padding(.trailing, 28)
            })
          }
          //sign in
          
          Button(action: {
            viewModel.login(withEmail: email, password: password)
            
          }, label: {
           Text("Sign In")
              .font(.headline)
              .foregroundColor(.white)
              .frame(width: 360, height: 50)
              .background(Color.purple)
              .clipShape(Capsule())
//              .cornerRadius(25)
              .padding()
          })
          
          Spacer()
          
          //go to sign up
          
          NavigationLink(destination: RegistrationView(), label: {
            HStack {
              Text("Don't have an account?")
                .font(.system(size: 14))
              Text("Sign UP")
                .font(.system(size: 14, weight: .semibold))
              
            }.foregroundColor(.white)
          })
          Button(action: {}, label: {
        
          }).padding(.bottom, 16)
        }
        .padding(.top, -44)
            
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LoginView()
    }
  }
}
