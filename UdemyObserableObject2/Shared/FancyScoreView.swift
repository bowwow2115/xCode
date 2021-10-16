//
//  FancyScoreView.swift
//  UdemyObserableObject2
//
//  Created by 박승훈 on 2021/08/13.
//

import SwiftUI

struct FancyScoreView: View {

    @Binding var score: Int

    var body: some View {
        VStack {
            Text("\(self.score)")
            Button("Increment Score") {
                self.score += 1
            }
                .padding()
                .background(Color.green)
        }
            .padding()
            .background(Color.orange)
    }
}
