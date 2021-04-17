//
//  MemoryGame.swift
//  memoryGame
//
//  Created by 박승훈 on 2021/04/17.
//Model

import Foundation

struct MemoryGame<CardContent>{
    var cards: Array<Card>
    
    func choose(card: Card){
        print("card chosen: \(card)")
    }
     
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>() // 배열은 이렇게 초기화 하는 듯(값 없이 할 때)
        for pairIndex in 0..<numberOfPairsOfCards{ //viewmodel을 통해 전달받는 nuberOfPairsOfCards를 카드 상한선으로 설정
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    struct Card: Identifiable { //Identifiable은 id를 필요로 하는 프로토콜을 가지고 있음,view에서 forEach를 사용할 때 각 카드가 구별되어야 하기 때문에 걸어줌
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
