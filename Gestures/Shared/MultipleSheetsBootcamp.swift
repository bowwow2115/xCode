//
//  MultipleSheetsBootcamp.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/05.
//

import SwiftUI

struct RandomModel: Identifiable {
  let id = UUID().uuidString
  let title: String
}

// 1 - user a binding
// 2 - use multiple .sheets
// 3 - user $item

struct MultipleSheetsBootcamp: View {
  
  //  @State var selectedModel: RandomModel = RandomModel(title: "Starting Title")
  //  @State var showSheet: Bool = false
  
  @State var selectedModel: RandomModel? = nil
  
  var body: some View {
    VStack(spacing: 20) {
      Button("Button 1") {
        selectedModel = RandomModel(title: "ONE")
      }
      Button("Button 2") {
        selectedModel = RandomModel(title: "TWO")
      }
    }
    .sheet(item: $selectedModel) { model in
      NextScreen(selectedModel: model)
    }
  }
}

struct NextScreen: View {
  
//  @Binding var selectedModel: RandomModel
  let selectedModel: RandomModel
  
  var body: some View {
    Text(selectedModel.title)
      .font(.largeTitle)
  }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    MultipleSheetsBootcamp()
  }
}
