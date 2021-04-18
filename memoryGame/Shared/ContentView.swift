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
                HStack(spacing:0) {
            ForEach(viewModel.cards){
                card in CardView(card: card)
                    .padding(.all, geometry.size.width/CGFloat((viewModel.cards.count)*10))
                .frame(width: geometry.size.width/CGFloat((viewModel.cards.count)), height: geometry.size.width/CGFloat((viewModel.cards.count))*3/2,
                       alignment: .center)
                .onTapGesture {
                viewModel.choose(card: card)
                }
            }
          
                    
            }
            
                .foregroundColor(Color.orange)
                .font(viewModel.cards.count > 3 ? Font.subheadline : Font.largeTitle)
                
              
        }
       
        
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
