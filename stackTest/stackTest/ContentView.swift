//
//  ContentView.swift
//  stackTest
//
//  Created by 박승훈 on 2021/04/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
          
        ZStack{
            Text("Hi")
            Text("hi2")
           
        }
            ZStack{
                Text("Hi")
                Text("hi2")
               
            }

            ZStack{
                Text("Hi")
                Text("hi2")
               
            }

    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
