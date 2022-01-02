//
//  ContentView.swift
//  Shared
//
//  Created by 박승훈 on 2021/12/02.
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
        .scaleEffect(getScaleAmount())
        .rotationEffect(Angle(degrees: getRotationAmont()))
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
  
  func getScaleAmount() -> CGFloat {
    let max = UIScreen.main.bounds.width / 2
    let currentAmount = abs(offset.width)
    let percentage = currentAmount / max
    return 1.0 - min(percentage, 0.5) / 2
  }
  
  func getRotationAmont() -> Double {
    let max = UIScreen.main.bounds.width / 2
    let currentAmount = offset.width
    let percentage = currentAmount / max
    let percentageAsDouble = Double(percentage)
    let maxAngle: Double = 10
    return percentageAsDouble * maxAngle
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
