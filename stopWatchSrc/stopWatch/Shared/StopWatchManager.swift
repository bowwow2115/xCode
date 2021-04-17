//
//  StopWatchManager.swift
//  stopWatch
//
//  Created by 박승훈 on 2021/03/31.
//

import SwiftUI

class StopWatchManager: ObservableObject {
    
    enum stopWatchMode {
        case running
        case stopped
        case paused
    }
    
    @Published var secondsElapsed = 0
    @Published var mode: stopWatchMode = .stopped
    
    var timer = Timer()
    
   
    func start(){
        
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            timer in self.secondsElapsed += 1
        }
    }
    
    func stop() {
          timer.invalidate()
          secondsElapsed = 0
          mode = .stopped
      }
    
    func pause(){
        timer.invalidate()
        mode = .paused
    }
    
  
}
