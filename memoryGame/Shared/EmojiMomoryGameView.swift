//
//  EmojiMomoryGameView.swift
//  Shared
//
//  Created by 박승훈 on 2021/04/17.
//View

import SwiftUI

struct EmojiMomoryGameView: View {

    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ForEach(viewModel.cards) {
                    card in CardView(card: card)
                        .padding(.all, geometry.size.width / CGFloat((viewModel.cards.count) * 10))
                        .frame(width: geometry.size.width / CGFloat((viewModel.cards.count)), height: geometry.size.width / CGFloat((viewModel.cards.count)) * 3 / 2,
                               alignment: .center)
                        .onTapGesture {
                        viewModel.choose(card: card)
                    }
                }
            }
                .foregroundColor(Color.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            EmojiMomoryGameView(viewModel: game)
            EmojiMomoryGameView(viewModel: game)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {

        GeometryReader { geometry in
            ZStack {

                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    // MARK: - Drawung Constants
    
    let cornerRadius:CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}
