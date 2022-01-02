//
//  CircleButtonVIew.swift
//  SwiftfulCrypto
//
//  Created by 박승훈 on 2021/12/22.
//

import SwiftUI

struct CircleButtonView: View {
  
  let iconName: String
  
    var body: some View {
      Image(systemName: iconName)
        .font(.headline)
        .foregroundColor(.theme.accent)
        .frame(width: 50, height: 50)
        .background(
          Circle()
            .foregroundColor(.theme.background)
        )
        .shadow(color: .theme.accent.opacity(0.25),
                radius: 10,
                x: 0,
                y: 0)
        .padding()
    }
}

struct CircleButtonVIew_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(iconName: "info")
        .previewLayout(.sizeThatFits)
      
      CircleButtonView(iconName: "plus")
      .previewLayout(.sizeThatFits)
      .colorScheme(.dark)
    }
}
