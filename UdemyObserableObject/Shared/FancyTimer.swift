//
//  FancyTimer.swift
//  UdemyObserableObject
//
//  Created by 박승훈 on 2021/08/13.
//

import Foundation
import SwiftUI
import Combine

class FancyTimer: ObservableObject {
    
    @Published var value: Int = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.value += 1
        }
    }
}
