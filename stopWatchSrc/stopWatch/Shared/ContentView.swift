//
//  ContentView.swift
//  Shared
//
//  Created by 박승훈 on 2021/03/31.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    var body: some View {
        
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            
            VStack{
                Spacer()
                
                Text(String(format: "%d", stopWatchManager.secondsElapsed))
                    
                    .font(.custom("Avenir", size: 40))
                    .padding(.top ,100)
                    .padding(.bottom,100)                    .foregroundColor(.blue)
                    .frame(width: 200, height:
                            100, alignment: .center)
                if stopWatchManager.mode == .stopped{
                    Button(action: {self.stopWatchManager.start()}){
                        TimerButton(label: "Start", buttonColor: .blue)
                    }
                }
                if stopWatchManager.mode == .running {
                    Button(action: {self.stopWatchManager.pause()}) {
                        TimerButton(label: "pause", buttonColor: .blue)
                    }
                }
                if stopWatchManager.mode == .paused {
                    Spacer()
                    Spacer()
                   
                           Button(action: {self.stopWatchManager.start()}) {
                               TimerButton(label: "Start", buttonColor: .blue)
                           }
                           Button(action: {self.stopWatchManager.stop()}) {
                               TimerButton(label: "Stop", buttonColor: .red)
                           }
                           .padding(.top, 30)
              
                    
        
            }
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerButton: View {
    
    let label: String
    let buttonColor: Color
    
    var body: some View {
        
        Text(label)
            .foregroundColor(.white)
            .padding(.vertical,10)
            .padding(.horizontal,90)
            .background(buttonColor)
            .cornerRadius(10)
    }
}

}
