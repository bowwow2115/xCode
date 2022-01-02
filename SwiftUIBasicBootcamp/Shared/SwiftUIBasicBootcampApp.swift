//
//  SwiftUIBasicBootcampApp.swift
//  Shared
//
//  Created by 박승훈 on 2021/12/20.
//

import SwiftUI

@main
struct SwiftUIBasicBootcampApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            FocusStateBootcamp()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
