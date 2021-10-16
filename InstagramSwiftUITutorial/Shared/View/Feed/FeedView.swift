//
//  FeedView.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/09.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
      ScrollView{
        LazyVStack(spacing: 32) {
          ForEach(0 ..< 10){ _ in
            FeedCell()
          }
        }
      }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
