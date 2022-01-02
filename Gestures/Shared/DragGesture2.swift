//
//  DragGesture2.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/02.
//

import SwiftUI

struct DragGesture2: View {
  
  @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
  @State var currentDragOffsetY: CGFloat = 0
  @State var endingOffsetY: CGFloat = 0
  
  var body: some View {
    ZStack {
      Color.green.ignoresSafeArea()
      /*offset은 현재 위치에서 x, y 기준으로 위치값 조정하는 것,
       여러 offset을 적용해서 각각의 값을 합산히여 적용
       ex: .offset(x: -10)
           .offset(x:  12)
            => x가 2만큼 우측으로 이동
       */
      SignUpView()
        .offset(y: startingOffsetY)
        .offset(y: currentDragOffsetY)
        .offset(y: endingOffsetY)
        .gesture(
          DragGesture()
            .onChanged { value in
              withAnimation(.spring()) {
                currentDragOffsetY = value.translation.height
              }
            }
            .onEnded { value in
              withAnimation(.spring()) {
                if currentDragOffsetY < -150 {
                  endingOffsetY = -startingOffsetY
                  currentDragOffsetY = 0
                } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                  endingOffsetY = 0
                  currentDragOffsetY = 0
                } else {
                  currentDragOffsetY = 0
                }
                
              }
              
            }
        )
      VStack{
        Text("currentOffsetY: \(currentDragOffsetY)")
        Text("startingOffsetY: \(startingOffsetY)")
        Text("endingOffsetY: \(endingOffsetY)")
      }
    }
  }
}

struct DragGesture2_Previews: PreviewProvider {
  static var previews: some View {
    DragGesture2()
  }
}

struct SignUpView: View {
  var body: some View {
    VStack(spacing: 20) {
      Image(systemName: "chevron.up")
        .padding(.top)
      Text("Sign up")
        .font(.headline)
        .fontWeight(.semibold)
      
      Image(systemName: "flame.fill")
        .resizable()
        .scaleEffect()
        .frame(width: 80, height: 100)
      
      Text("Create An Account")
        .foregroundColor(.white)
        .font(.headline)
        .padding()
        .padding(.horizontal)
        .background(Color.black.cornerRadius(10))
      
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(30)
  }
}
