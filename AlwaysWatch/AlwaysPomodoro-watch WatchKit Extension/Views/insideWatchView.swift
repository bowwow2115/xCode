//
//  insideWatchView.swift
//  AlwaysPomodoro-watch WatchKit Extension
//
//  Created by 박승훈 on 2021/11/14.
//

import SwiftUI

struct insideWatchView: View {
  
  
  
  var body: some View {
    GeometryReader{ geometry in
      
      
      let geometryWith = geometry.size.width
      let geometryHeight = geometry.size.height + geometry.safeAreaInsets.top
      
      let handleDiameter = geometry.size.width/7
      let width = geometry.size.width - handleDiameter*2
      let height = geometry.size.height + geometry.safeAreaInsets.top - handleDiameter*2
      
      
        RoundedRectangle(cornerRadius: 20)
          .frame(width: width, height: height, alignment: .center)
          .position(x: geometryWith/2, y: geometryHeight/2)
          .foregroundColor(.yellow)
          .ignoresSafeArea()
        
      
        
      
        
      
    }
  }
}

struct insideWatchView_Previews: PreviewProvider {
  static var previews: some View {
    insideWatchView()
  }
}
