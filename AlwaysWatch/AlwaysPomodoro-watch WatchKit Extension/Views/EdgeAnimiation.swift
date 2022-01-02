//
//  EdgeAnimiation.swift
//  AlwaysPomodoro-watch WatchKit Extension
//
//  Created by 박승훈 on 2021/11/08.
//

import SwiftUI

struct EdgeAnimiation: View {
  var body: some View {
    GeometryReader{ geometry in
      
      let width = geometry.size.width
      let height = geometry.size.height + geometry.safeAreaInsets.top
      let diameter = width/7
      
      ZStack{
        //        Rectangle()
        //          .frame(width: geometry.size.width, height: geometry.safeAreaInsets.top+geometry.size.height)
        //          .foregroundColor(.blue)
        //          .cornerRadius(45)
        //
        //        Rectangle()
        //          .size(width: geometry.size.width, height: geometry.size.width/5)
        
        HStack{
          
          Rectangle()
            .frame(width: diameter, height: height)
          
          Spacer()
          
          Rectangle()
            .frame(width: diameter, height: height)
          
        }
        
        VStack{
          Rectangle()
            .frame(width: width, height: diameter)
          Spacer()
          
          Rectangle()
            .frame(width: width, height: diameter)
        }
        
        Circle()
          .size(width: diameter, height: diameter)
          .foregroundColor(.red)
      }
      .frame(width: width, height: height)
      .ignoresSafeArea()
      insideWatchView()
    }
    
   
    
  }
}

struct EdgeAnimiation_Previews: PreviewProvider {
  static var previews: some View {
    EdgeAnimiation()
  }
}
