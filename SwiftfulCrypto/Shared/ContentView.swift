//
//  ContentView.swift
//  Shared
//
//  Created by 박승훈 on 2021/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack {
        
        Color.theme.background
          .ignoresSafeArea()
        
        VStack(spacing: 40) {
          
          Text("Accent Color")
            .foregroundColor(Color.theme.accent)
          
          Text("SecondaryTextColor")
            .foregroundColor(Color.theme.secondaryText)
          
          Text("Red Color")
            .foregroundColor(Color.theme.red)
          
          Text("Green Color")
            .foregroundColor(Color.theme.green)
        }
        .font(.headline)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
