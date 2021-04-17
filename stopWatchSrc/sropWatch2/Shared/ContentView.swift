//
//  ContentView.swift
//  Shared
//
//  Created by 박승훈 on 2021/04/03.
//

import SwiftUI
import UserNotifications
import Foundation
import UIKit

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View{
    
    @State var start = false
    @State var to : CGFloat = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var count = 0
    @State var settedTime: CGFloat = 0
    
    @State var isclicked = false
    //다이얼에서 값 받아서 처리하도록
    //    lazy var countTo: Int
    
    var body : some View{
              
        
        ZStack{
            Color.black.edgesIgnoringSafeArea(.vertical)
            
            Spacer()
            
            VStack {
                Spacer()
                Spacer()
                ZStack{
                    clockView(to: $to, settedTime: $settedTime, isclicked: $isclicked)
                    VStack{
                        
                        
                        if isclicked{
                            Text(clockFormat(num: CGFloat(self.count))) //시작되었을때
                                .font(.system(size: 45))
                                .padding(.pi)
                                .foregroundColor(.white) }
                        
                        else{
                            Text(clockFormat(num: self.to*60*60*6)) //시작 안했을 때
                                .font(.system(size: 45))
                                .padding(.pi)
                                .foregroundColor(.white)
                        }
                        if isclicked{
                            Text(clockFormat(num: self.settedTime*60*60*6))
                                .font(.title)
                                .foregroundColor(.blue)
                            
                        }
                    }
                }
                //onAppear ondisappear을 통해 시간설정한 것을 없애고 시간 흘러가는 것을 보여주자
                //.onAppear(perform: {countUp(hour: 05, minute: 00,  seconds: 00)})
                
                
                Spacer()
                MyButton(start: $start, to: $to, count: $count,isClicked: $isclicked, settedTime: $settedTime)
                Spacer()
                Spacer()
                Spacer()
            }
            .onAppear(perform: {
                UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
                }
            })
            .padding(.top, 55)
            //타이머 동작시에 해줄 작업
            .onReceive(self.time) { (_) in
                
                
                if self.start{
                    
                    if (self.count <= Int(settedTimeCrtd(num: settedTime)*60*60*6)){//settedTime
                        
                        self.count += 1
                        print("to = \(to*60*60*6)")
                        print("count = \(count)")
                        print("settedTime: \(self.settedTime*60*60*6)")
                        withAnimation(.default){
                            self.to = (CGFloat(self.count) / (settedTime*60*60*6))//settedTime
                        }
                    }
                    else{
                        self.to = 1
                        self.start.toggle()
                        
                        Noitfy()
                    }
                }
                
            }
        }
        
    }
    func Noitfy(){
        
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "Congraturation you did good"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
        
    }
    
    func clockFormat(num :CGFloat) -> String {
        
        let currentTime = (Int( num )) //계산할때는 count을 사용하자
        let seconds = currentTime % 60
        var minutes = Int(currentTime / 60)
        let hours  = Int(currentTime / 3600)
        
        if (minutes%60) == 0{
            minutes = 00
            
        }else if(currentTime > 3600){
            minutes = minutes - 60 * hours
        }
        
        return "\(hours < 10 ? "0" : "" )\(hours):\(minutes < 10 ? "0" : "")\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"//스트링 값과 연산을 통해 스트링으로 자동 변환
    }
    func settedTimeCrtd(num: CGFloat) -> CGFloat{
        let a = (floor(num * 10000000))/10000000
        return a
    }
    
x     UserDefaults.standard.setValue(Date(), forkey: "senceDidEnterBackGround")
    
}







