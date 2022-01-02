//
//  SwiftfulCryptoApp.swift
//  Shared
//
//  Created by 박승훈 on 2021/12/22.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
  
  @StateObject private var vm = HomeViewModel()
  
    var body: some Scene {
        WindowGroup {
          NavigationView {
            HomeView()
              .navigationBarHidden(true)
          }
          .environmentObject(vm)
        }
    }
}
