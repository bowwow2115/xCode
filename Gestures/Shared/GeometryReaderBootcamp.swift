//
//  GeometryReaderBootcamp.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/05.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
  var body: some View {
    GeometryReader { geometry in
      HStack(spacing: 0) {
        Rectangle()
          .fill(Color.red)
          .frame(width: UIScreen.main.bounds.width * 0.6666)
        
        Rectangle().fill(Color.blue)
      }
      .ignoresSafeArea()
    }
  }
}

struct GeometryReaderBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReaderBootcamp()
  }
}
