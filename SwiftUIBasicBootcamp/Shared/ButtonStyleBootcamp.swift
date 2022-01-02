//
//  ButtonStyleBootcamp.swift
//  SwiftUIBasicBootcamp
//
//  Created by 박승훈 on 2021/12/21.
//

import SwiftUI

struct ButtonStyleBootcamp: View {
    var body: some View {
      VStack {
        Button("Button Style") {
          print("button1")
        }
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .buttonStyle(.plain)
        Button("Button Style") {
          print("button1")
        }
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .buttonStyle(.bordered)
        Button("Button Style") {
          print("button1")
        }
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .buttonStyle(.borderedProminent)
        Button("Button Style") {
          print("button1")
        }
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .buttonStyle(.borderless)
      }
    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
