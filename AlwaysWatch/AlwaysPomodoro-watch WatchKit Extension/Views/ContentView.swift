//
//  ContentView.swift
//  AlwaysPomodoro-watch WatchKit Extension
//
//  Created by 박승훈 on 2021/11/07.
//

import SwiftUI

struct ContentView: View {
    @State var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("\(timeRemaining)")
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
      EdgeAnimiation()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
