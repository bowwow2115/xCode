//
//  FocusStateBootcamp.swift
//  SwiftUIBasicBootcamp
//
//  Created by 박승훈 on 2021/12/21.
//

import SwiftUI

struct FocusStateBootcamp: View {
  
  enum OnboardingFields {
    case username
    case password
  }
  
//  @FocusState private var usernameInFocus: Bool
  @State private var username: String = ""
  
//  @FocusState private var passwordInFocus: Bool
  @State private var password: String = ""
  
  @FocusState private var fieldInFocus: OnboardingFields?
  
    var body: some View {
      VStack(spacing: 20) {
        TextField("Add your name here....", text: $username)
          .focused($fieldInFocus, equals: .username)
          .padding(.leading)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
          .background(Color.gray.brightness(0.3))
          .cornerRadius(10)
        
        SecureField("Add your password here....", text: $password)
          .focused($fieldInFocus, equals: .password)
          .padding(.leading)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
          .background(Color.gray.brightness(0.3))
          .cornerRadius(10)
        
        //박승훈 박승훈 
        Button("Toggle Focus State") {
          let usernameIsValid = !username.isEmpty
          let passwordIsValid = !password.isEmpty
          if usernameIsValid && passwordIsValid {
            print("Sign up")
          } else if usernameIsValid {
            fieldInFocus = .password
//            usernameInFocus = false
//            passwordInFocus = true
          } else {
            fieldInFocus = .username
//            usernameInFocus = true
//            passwordInFocus = false
          }
        }
        
//        Button("Toggle Focus State") {
//          usernameInFocus.toggle()
//        }
        
      }
      .padding(40)
//      .onAppear {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//          self.usernameInFocus = true
//        }
//      }
    }
}

struct FocusStateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateBootcamp()
    }
}
