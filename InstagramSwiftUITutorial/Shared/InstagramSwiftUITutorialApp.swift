//
//  InstagramSwiftUITutorialApp.swift
//  Shared
//
//  Created by 박승훈 on 2021/10/09.
//

import SwiftUI
import Firebase

@main
struct InstagramSwiftUITutorialApp: App {
  
  init() {
    FirebaseApp.configure()
  }
  
    var body: some Scene {
        WindowGroup {
          ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
