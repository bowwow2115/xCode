//
//  BackgroundThreadBootcamp.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/09.
//

import SwiftUI

class BackgorundThreadViewModel: ObservableObject {
  
  @Published var dataArray: [String] = []
  
  //  init() {
  //    fetchData()
  //  }
  
  func fetchData() {
    DispatchQueue.global(qos: .background).async {
      let newData = self.downloadData()
      
      print("CHECK 1: \(Thread.isMainThread)")
      print("CHECK 1: \(Thread.current)")
      
      DispatchQueue.main.async {
        self.dataArray = newData
        print("CHECK 2: \(Thread.isMainThread)")
        print("CHECK 2: \(Thread.current)")
      }
      
    }
  }
  
  private func downloadData() -> [String] {
    var data: [String] = []
    
    for x in 0..<100 {
      data.append("\(x)")
      print(data)
    }
    return data
  }
}


struct BackgroundThreadBootcamp: View {
  
  @StateObject var vm = BackgorundThreadViewModel()
  
  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        Text("Load Data")
          .font(.largeTitle)
          .fontWeight(.semibold)
          .onTapGesture {
            vm.fetchData()
          }
        
        ForEach(vm.dataArray, id: \.self) { item in
          Text(item)
            .font(.headline)
            .foregroundColor(.red)
        }
      }
    }
  }
}

struct BackgroundThreadBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundThreadBootcamp()
  }
}
