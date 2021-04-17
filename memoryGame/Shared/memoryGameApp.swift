//
//  memoryGameApp.swift
//  Shared
//
//  Created by 박승훈 on 2021/04/17.
//

import SwiftUI

@main
struct memoryGameApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
