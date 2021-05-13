//
//  EmojiMemoryGame.swift
//  memoryGame
//
//  Created by 박승훈 on 2021/04/17. 
// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject { //
    
    @Published private var model: MemoryGame<String> = createMemoryGame() //값이 변경될 때마다 objectWillSend 를 통해 값을 보냄
    
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
    
    
   
    init(){
        self.model.cards = self.model.cards.shuffled()//초기화 할 때 한번만 작동한다.
    }
    
    // MARK: - Access to the Model
    //프라이빗 접근자를 통해 보호
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
    
        model.choose(card: card)
    }
    
    
}
