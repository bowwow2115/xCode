//
//  PostGridView.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/10.
//

import SwiftUI

struct PostGridView: View {
  
  private let items = [GridItem(), GridItem(), GridItem()]
  private let width = UIScreen.main.bounds.width / 3
  
    var body: some View {
      
      LazyVGrid(columns: items, content: {
        ForEach(0 ..< 7) { _ in
          NavigationLink(
            destination: FeedView(),
            label: {
              Image("sasaki")
            .resizable()
            .scaledToFill()
            .frame(width: width, height: width)
            .clipped()
        })
        }
      })
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
