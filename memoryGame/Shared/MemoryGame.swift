//
//  MemoryGame.swift
//  memoryGame
//
//  Created by 박승훈 on 2021/04/17.
//Model

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    //시작한 시점
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    //struct는 값 복사를 하지 않기 떄문에 self를 써도 상위값을 변경시킬 수 없다. 대신 mutating이라는 하위 함수를 생성시켜 값을 변경시키도록 할 수 있다.
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card) {
            self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        }
    }


    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>() // 배열은 이렇게 초기화 하는 듯(값 없이 할 때)
        for pairIndex in 0..<numberOfPairsOfCards { //viewmodel을 통해 전달받는 nuberOfPairsOfCards를 카드 상한선으로 설정
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable { //Identifiable은 id를 필요로 하는 프로토콜을 가지고 있음,view에서 forEach를 사용할 때 각 카드가 구별되어야 하기 때문에 걸어줌
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
