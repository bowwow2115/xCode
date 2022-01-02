//
//  HapticManager.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/06.
//

import SwiftUI

class HapticManager {
  
  static let instance = HapticManager()
  
  func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(type)
  }
  
  func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let generator = UIImpactFeedbackGenerator(style: style)
    generator.impactOccurred()
  }
}

struct HapticsBootcamp: View {
    var body: some View {
      VStack(spacing: 20) {
        Button("success") { HapticManager.instance.notification(type: .success) }
        Button("warning") { HapticManager.instance.notification(type: .warning) }
        Button("error") { HapticManager.instance.notification(type: .error) }
        Divider()
        Button("") { HapticManager.instance.impact(style: .soft) }
      }
    }
}

struct HapticManager_Previews: PreviewProvider {
    static var previews: some View {
      HapticsBootcamp()
    }
}
