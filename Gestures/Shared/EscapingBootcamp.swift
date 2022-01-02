//
//  EscapingBootcamp.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/10.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
  
  @Published var text: String = "Hello"
  
  func getData() {
    downloadData4 { [weak self] (returnedData) in
      self?.text = returnedData.data
      print(self?.text)
    }
    doSomething("hi")
  }
  
  func downloadData() -> String {
    return "New Data!"
  }
  
  func downloadData2(completionHandler: (_ data: String) -> Void) {
    completionHandler("New data!")
  }
  
  func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      completionHandler("New data!")
    }
  }
  
  func downloadData4(completionHandler: @escaping DownloadCompletion) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      let result = DownloadResult(data: "NEW DATA")
      completionHandler(result)
    }
  }
  
  func doSomething(_ data: String) -> () {
    print(data)
  }
}

struct DownloadResult {
  let data: String

}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingBootcamp: View {
  
  @StateObject var vm = EscapingViewModel()
  
  var body: some View {
    Text(vm.text)
      .font(.largeTitle)
      .fontWeight(.semibold)
      .foregroundColor(.blue)
      .onTapGesture {
        vm.getData()
      }
  }
}

struct EscapingBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    EscapingBootcamp()
  }
}
