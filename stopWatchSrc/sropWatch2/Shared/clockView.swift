//
//  clockView.swift
//  stopWatch2
//
//  Created by 박승훈 on 2021/04/04.
//

import SwiftUI


struct clockView : View{
    
    //타이머에 따라 움직이는 원(1 전체값 비례)
    @Binding var to : CGFloat
    @Binding var settedTime: CGFloat
    @Binding var isclicked: Bool
    @State var a: Color = Color.blue
    
    let generator = UINotificationFeedbackGenerator()
    
    
    let maxTime: CGFloat = 60*60*6
    let stepSize: CGFloat = 60*15
    
    
    
    
    func angle(between starting: CGPoint, ending: CGPoint) -> CGFloat {
        let center = CGPoint(x: ending.x - starting.x, y: ending.y - starting.y)
        let radians = atan2(center.y, center.x)
        var degrees = 90 + (radians * 180 / .pi)
        
        if degrees < 0 {
            degrees += 360
        }
        
        return degrees
    }
    
    
    
    
    var body: some View{
        //피커 원
        if !isclicked{
        Circle()
            .fill(Color.black.opacity(1))
            .frame(width: 280, height: 280)
            .rotationEffect(.degrees(-90))
            .gesture(
                DragGesture().onChanged() { to in
                    ///haptic
                    let selectionFeedback = UISelectionFeedbackGenerator()
                    selectionFeedback.selectionChanged()
                    ///
                    let x: CGFloat = min(max(to.location.x, 0), 280)
                    let y: CGFloat = min(max(to.location.y, 0), 280)
                    
                    let ending = CGPoint(x: x, y: y)
                    let start = CGPoint(x: 280 / 2, y: 280 / 2)
                    
                    
                    let angle = self.angle(between: start, ending: ending)
                    self.to = CGFloat(Int(((angle / 360) * (self.maxTime / self.stepSize)))) / (self.maxTime / self.stepSize)
                    self.settedTime = CGFloat(Int(((angle / 360) * (self.maxTime / self.stepSize)))) / (self.maxTime / self.stepSize)
                    
                })}
        //기본 원
        Circle()
            .trim(from: 0.0, to: 1.0)
            .stroke(Color.white.opacity(0.2)
                    , style: StrokeStyle(lineWidth: 35, lineCap: .round)).frame(width: 280, height: 280)
        //다이얼 식으로 시간세팅하게끔 하자(30분간격으로 돌릴때마다 진동)
        //세팅시간이 원전체 둘레 스탑워치시간이 거기서 채워나가게 끔(쿼터마다 색변화)
        
        //움직이는 원
   
        Circle()
            .trim(from: 0.0, to: to)
            .stroke(Color.blue.opacity(0.7)
            
                    , style: StrokeStyle(lineWidth: 35, lineCap: .round)).frame(width: 280, height: 280)
            .rotationEffect(.init(degrees: -90))
            .animation(
                .easeInOut
            )
        
    }

}


