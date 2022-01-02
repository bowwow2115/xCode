//
//  TimerBootcamp.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/14.
//

import SwiftUI

struct TimerBootcamp: View {
  
  let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
  
  //Current TIme
  /*
   @State var currentDate: Date = Date()
   
   var dateFormatter: DateFormatter {
   let formatter = DateFormatter()
   //    formatter.dateStyle = .medium
   formatter.timeStyle = .medium
   return formatter
   }
   */
  
  //Countdown
  
//   @State var count: Int = 10
   @State var finishedText: String? = nil
   
  
  //Countdown to date
  
   @State var timeRemaining: String = ""
   let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1,  to: Date()) ?? Date()
   
   func updateTimeRemaining() {
   let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
   let hour = remaining.hour ?? 0
   let minute = remaining.minute ?? 0
   let second = remaining.second ?? 0
   timeRemaining = "\(hour):\(minute):\(second)"
   }
   
  
  //Animation counter
  @State var count: Int = 0
  
  var body: some View {
    ZStack {
      RadialGradient(gradient: Gradient(colors: [.purple, .gray] ),
                     center: .center,
                     startRadius: 5,
                     endRadius: 500)
        .ignoresSafeArea()
      
      HStack(spacing: 15) {
        Circle()
          .offset(y: count == 1 ? -20 : 0)
        Circle()
          .offset(y: count == 2 ? -20 : 0)
        Circle()
          .offset(y: count == 3 ? -20 : 0)
      }
      //      .frame(width: 200)
      //      .foregroundColor(.white)
      //      TabView(selection: $count) {
      //        Rectangle()
      //          .foregroundColor(.red)
      //          .tag(1)
      //        Rectangle()
      //          .foregroundColor(.green)
      //          .tag(2)
      //        Rectangle()
      //          .foregroundColor(.blue)
      //          .tag(3)
      //        Rectangle()
      //          .foregroundColor(.yellow)
      //          .tag(4)
      //        Rectangle()
      //          .foregroundColor(.purple)
      //          .tag(5)
      //      }
      //      .frame(height: 200)
      //      .tabViewStyle(PageTabViewStyle())
    }
    .onReceive(timer, perform: { _ in
      withAnimation(.easeInOut(duration: 1.0)) {
                count = count == 3 ? 0 : count + 1
      }
    })
  }
}


struct TimerBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    TimerBootcamp()
  }
}
