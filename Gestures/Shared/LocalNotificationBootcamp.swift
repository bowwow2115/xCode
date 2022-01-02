//
//  LocalNotificationBootcamp.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/06.
//

import SwiftUI
import UserNotifications

class NotificationManager {
  
  static let instance = NotificationManager()
  
  func requestAuthrization() {
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
      if let error = error {
        print("ERROR: \(error)")
      } else {
        print("SUCCESS")
      }
    }
  }
  
  func scheduleNotification() {
    let content = UNMutableNotificationContent()
    content.title = "This is my first notification!"
    content.subtitle = "THis was so easy"
    content.sound = .default
    content.badge = 1
    
    //time
//    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
    //calaender
    var dateComponents = DateComponents()
    dateComponents.hour = 15
    dateComponents.minute = 42
    dateComponents.weekday = 2

    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
    
    //location
//    var nsCoder: NSCoder
//    let trigger = UNLocationNotificationTrigger(coder: NSCoder)
//
    let requset = UNNotificationRequest(
      identifier: UUID().uuidString,
      content: content,
      trigger: trigger
    )
    UNUserNotificationCenter.current().add(requset)
  }
}

struct LocalNotificationBootcamp: View {
  var body: some View {
    VStack(spacing: 40) {
      Button("Request permission") {
        NotificationManager.instance.requestAuthrization()
      }
      Button("Schedule notification") {
        NotificationManager.instance.scheduleNotification()
      }
    }
    .onAppear {
      UIApplication.shared.applicationIconBadgeNumber = 0
    }
  }
}

struct LocalNotificationBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    LocalNotificationBootcamp()
  }
}
