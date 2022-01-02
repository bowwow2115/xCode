//
//  EmojiArtViewModel.swift
//  EmojiArt (iOS)
//
//  Created by 박승훈 on 2021/12/01.
//

import SwiftUI

class EmojiArtDocument: ObservableObject {
  
  @Published private(set) var emojiArt: EmojiArtModel
  
  init() {
    emojiArt = EmojiArtModel()    
  }
  
  var emojis: [EmojiArtModel.Emoji] { emojiArt.emojis }
  var background: EmojiArtModel.Background { emojiArt.background }
  
}
