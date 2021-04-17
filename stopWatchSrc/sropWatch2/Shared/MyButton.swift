//
//  MyButton.swift
//  sropWatch2
//
//  Created by 박승훈 on 2021/04/04.
//

import SwiftUI

struct MyButton: View {
    
    @Binding var start : Bool
    @Binding var to : CGFloat
    @Binding var count : Int
    @Binding var isClicked: Bool
    @Binding var settedTime: CGFloat

    
    
    var body: some View {
        HStack(spacing: 20){
            
            Button(action: {
                       
                if self.count == Int(settedTime*60*60*6){//여기도 시간 캡쳐값 넣어야 함

                    self.count = 0
                    withAnimation(.default){
                        self.to = 0
                        
                    }
                }
                self.to = 1
                //움직이는원 빨강으로 만들기
                self.isClicked = true
                self.start.toggle()
                
            }) {
                HStack(spacing: 15){
                    
                    Image(systemName: self.start ? "pause.fill" : "play.fill").foregroundColor(.white)
                    
                    Text(self.start ? "Pause" : "Play").foregroundColor(.white)
                        .padding(.vertical)
                }
                .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                .background(Color.blue)
                .clipShape(Capsule())
                .shadow(radius: 6)
            }
            
            Button(action: {
                self.count = 0
                self.isClicked = false
                withAnimation(.default){
                    self.to = 0
                }
            }) {
                HStack(spacing: 15){
                    
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                    
                    Text("Restart").foregroundColor(.white)
                }
                .padding(.vertical)
                
                .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                .background(
                    Color.red
                )
                .clipShape(Capsule())
                .shadow(radius: 6)
            }
            
        }
    }
}
