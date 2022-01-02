//
//  ContentView.swift
//  Shared
//
//  Created by 박승훈 on 2021/11/29.
//

import SwiftUI

struct ContentView: View {
  
  
  @State var offset: CGSize = .zero
  
    var body: some View {
      ZStack {
        
        VStack {
          Text("\(offset.width)")
          Spacer()
        }
        
        RoundedRectangle(cornerRadius: 20)
          .frame(width: 300, height: 500)
          .offset(offset)
          .scaleEffect(1.0)
          .gesture(
            DragGesture()
              .onChanged { value in
                withAnimation(.spring()) {
                  offset = value.translation
                  print("onChanged: \(offset)")
                }
              }
              .onEnded { value in
                withAnimation(.spring()) {
                  offset = .zero
                  print("onEnded:  \(offset)")
                }
              }
        )
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
