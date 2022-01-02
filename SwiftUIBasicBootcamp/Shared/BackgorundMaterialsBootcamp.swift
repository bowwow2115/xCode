//
//  BackgorundMaterialsBootcamp.swift
//  SwiftUIBasicBootcamp
//
//  Created by 박승훈 on 2021/12/20.
//

import SwiftUI

struct BackgorundMaterialsBootcamp: View {
    var body: some View {
      VStack {
        Spacer()
        
        VStack {
          Text("HI")
        }
        .frame(height: 350)
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .cornerRadius(30)
      }
      .ignoresSafeArea()
      .background(
        Image("사사키_아키")
      )
    }
}

struct BackgorundMaterialsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgorundMaterialsBootcamp()
    }
}
