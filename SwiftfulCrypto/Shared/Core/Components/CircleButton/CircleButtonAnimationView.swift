//
//  CircleButtonAnimationView.swift
//  SwiftfulCrypto
//
//  Created by 박승훈 on 2021/12/22.
//

import SwiftUI

struct CircleButtonAnimationView: View {
  
  @Binding var animate: Bool
  
    var body: some View {
        Circle()
        .stroke(lineWidth: 5.0)
        .scale(animate ? 1.0 : 0.0)
        .opacity(animate ? 0.0 : 1.0)
        .animation(animate ? Animation.easeOut(duration: 0.1) : .none)
//        .onAppear {
//          animate.toggle()
//        }
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
      CircleButtonAnimationView(animate: .constant(false))
    }
}
