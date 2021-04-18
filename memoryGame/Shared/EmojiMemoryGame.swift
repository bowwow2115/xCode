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
        func randomCard() -> Array<String>{
            
            let random = Int.random(in:0..<5)
            
            switch random {
            
            case 0:
                let emojis: Array<String> = ["🐪"]
                return emojis
            case 1:
                let emojis: Array<String> = ["🐪","😈"]
                return emojis
            case 2:
                let emojis: Array<String> = ["🐪","😈","🔥"]
                return emojis
            case 3:
                let emojis: Array<String> = ["🐪","😈","🔥", "☀️"]
                return emojis
            case 4:
                let emojis: Array<String> = ["🐪","😈","🔥", "☀️", "🌧"]
                return emojis
            default:
                let emojis: Array<String> = []
                return emojis
                
            }
        }
        let emojis: Array<String> = randomCard()
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in  emojis[pairIndex] }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards.shuffled()
    }
    
    
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    
}
