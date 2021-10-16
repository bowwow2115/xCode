//
//  RegistrationView.swift
//  InstagramSwiftUITutorial (iOS)
//
//  Created by 박승훈 on 2021/10/11.
//

import SwiftUI

struct RegistrationView: View {
  
  @State private var email = ""
  @State private var fullname = ""
  @State private var username = ""
  @State private var password = ""
  @State private var selectedImage: UIImage?
  @State private var image: Image?
  @State var imagePickerPresented = false
  @Environment(\.presentationMode) var mode
  @EnvironmentObject var viewModel: AuthViewModel
  
    var body: some View {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [Color.purple, .blue]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        VStack {
          if let image = image {
            image
              .resizable()
              .scaledToFill()
              .frame(width: 140, height: 140)
              .clipShape(Circle())
              .padding(.top, 44)
              .foregroundColor(.white)
          }else{
            Button(action: { imagePickerPresented.toggle()}, label: {
              Image(systemName: "plus.circle")
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .foregroundColor(.white)
            }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
              ImagePicker(image: $selectedImage)
            })
              .padding()
          }
      
          
          //email field
          VStack {
            CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
              .padding()
              .background(Color(.init(white: 1, alpha: 0.15)))
              .cornerRadius(10)
              .foregroundColor(.white)
              .padding(.horizontal, 32)
            CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
              .padding()
              .background(Color(.init(white: 1, alpha: 0.15)))
              .cornerRadius(10)
              .foregroundColor(.white)
              .padding(.horizontal, 32)
            CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
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
          //sign in
          Button(action:{
            viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)
            
          } , label: {
           Text("Register")
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
          Button(action: {mode.wrappedValue.dismiss()}, label: {
            HStack {
              Text("Already have an account?")
                .font(.system(size: 14))
              Text("Sign In")
                .font(.system(size: 14, weight: .semibold))
              
            }.foregroundColor(.white)
          })
          Button(action: {}, label: {
        
          }).padding(.bottom, 16)
        }
        
            
      }
    }
}

extension RegistrationView {
  func loadImage() {
    guard let selectedImage = selectedImage else { return }
    image = Image(uiImage: selectedImage)
  }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
