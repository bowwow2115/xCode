//
//  ContentView.swift
//  Shared
//
//  Created by 박승훈 on 2021/08/13.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fancyTimer = FancyTimer()
    
    var body: some View {
        Text("\(fancyTimer.value)")
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
