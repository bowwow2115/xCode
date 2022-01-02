//
//  DownloadWithEscapingBootcamp.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/12.
//

import SwiftUI

//struct PostModel: Identifiable, Codable {
//  let userId: Int
//  let id: Int
//  let title: String
//  let body: String
//}

class DownloadWithEscapongViewModel: ObservableObject {
  
  @Published var posts: [PostModel] = []
  
  init() {
    getPosts()
  }
  
  func getPosts() {
    
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    //@escaping 으로 정의된 내용이라 함수 가장 마지막에 실행되는 내용
    print("completionhandler 클로져 시작")
    downloadData(fromURL: url) { returnedData in
      print("completionhandler 클로져 내부로직 시작")
      if let data = returnedData {
        guard let newPost = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
        DispatchQueue.main.async { [weak self] in
          self?.posts = newPost
        }
      } else {
        print("No data returned")
      }
      
      print("completion 클로져 종료")
    }
    
    // asnyc 비동기 방식
    //    URLSession.shared.dataTask(with: url) { (data, response, error) in
    //      guard let data = data,
    //            error == nil,
    //            let response = response as? HTTPURLResponse,
    //            response.statusCode >= 200 && response.statusCode < 300 else {
    //        print ("ERROR: error downloading data.")
    //        return
    //      }
    //
    //      print("SUCCESSFULLY DOWNLOADED DATA!")
    //      print(data)
    //      let jsonString = String(data: data, encoding: .utf8)
    //      print(jsonString)
    
    //      guard let newPost = try? JSONDecoder().decode(PostModel.self, from: data) else { return }
    //
    //      DispatchQueue.main.async {
    //        self.posts.append(newPost)
    //      }
    
    //    }.resume()
    
  }
  
  func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
    
    print("downloadData 함수 실행")
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data,
            error == nil,
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
              print ("ERROR: error downloading data.")
              return
            }
      print("@escaping completionHandler 인자 전달")
      completionHandler(data)
      print("downloadData 함수 종료")
    }.resume()
  }
  
}

struct DownloadWithEscapingBootcamp: View {
  
  @StateObject var vm = DownloadWithEscapongViewModel()
  
  var body: some View {
    List {
      ForEach(vm.posts) { post in
        VStack(alignment: .leading) {
          Text(post.title)
            .font(.headline)
          Text(post.body)
            .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
      }
    }
  }
}

struct DownloadWithEscapingBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    DownloadWithEscapingBootcamp()
  }
}
