//
//  ContentView.swift
//  Shared
//
//  Created by 박승훈 on 2021/04/17.
//View

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    func a(){
        print(CGFloat((viewModel.cards.count)))
    }
    
    var body: some View {
      
      
            GeometryReader { geometry in
                HStack {
            ForEach((viewModel.cards).shuffled()){
                card in CardView(card: card)
                .frame(width: geometry.size.width/CGFloat((viewModel.cards.count)), height: geometry.size.width/CGFloat((viewModel.cards.count))*3/2)
                .onTapGesture {
                viewModel.choose(card: card)
                }
            }
            }
        
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
      
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
      
        ZStack {
         
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        
        
     
    }
    }
}
