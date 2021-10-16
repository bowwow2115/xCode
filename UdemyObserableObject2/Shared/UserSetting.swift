//
//  UserSetting.swift
//  UdemyObserableObject2
//
//  Created by 박승훈 on 2021/08/13.
//

import Foundation
import SwiftUI
import Combine

class UserSettings: ObservableObject {
    
    @Published var score: Int = 0
}
