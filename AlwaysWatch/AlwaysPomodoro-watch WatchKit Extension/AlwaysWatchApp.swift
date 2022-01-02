//
//  AlwaysWatchApp.swift
//  AlwaysPomodoro-watch WatchKit Extension
//
//  Created by 박승훈 on 2021/11/07.
//

import SwiftUI

@main
struct AlwaysWatchApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
