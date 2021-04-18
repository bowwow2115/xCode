//
//  EmojiMemoryGame.swift
//  memoryGame
//
//  Created by 박승훈 on 2021/04/17. 
// ViewModel

import SwiftUI

class EmojiMemoryGame{

    private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> { //초기화 되기 전에는 function을 사용할 수 없어서 static을 사용
        let emojis: Array<String> = ["🐪","😈","🔥"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in  emojis[pairIndex] }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
   
}
