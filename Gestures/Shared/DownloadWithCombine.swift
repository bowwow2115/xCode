//
//  DownloadWithCombine.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/13.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
  
  @Published var posts: [PostModel] = []
  var cancellables = Set<AnyCancellable>()
  
  init() {
    getPosts()
  }
  
  func getPosts() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    // 1. sign up for monthly subscription for package to be delivered
    // 2. the company would make the package behind the scene
    // 3. receive the package at your front door
    // 4. make sure the box isn't damaged
    // 5. open and make sure the item is correct
    // 6. use the item!!!
    // 7. cancellable at any time!!
    
    // 1. create the publisher
    // 2. subscribe publihsger on backgorund thread
    // 3. receive on main thread
    // 4. tryMap (check that the data is good)
    // 5. decode (decode data into PostModels)
    // 6. sink (put the item into our app)
    // 7. store (cancel subscription if needed)
    
    URLSession.shared.dataTaskPublisher(for: url)
      .subscribe(on: DispatchQueue.global(qos: .background))
      .receive(on: DispatchQueue.main)
      .tryMap { (data, response) -> Data in
        guard
          let response = response as? HTTPURLResponse,
          response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
          }
        return data
      }
      .decode(type: [PostModel].self, decoder: JSONDecoder())
//      .replaceError(with: <#T##[PostModel]#>)
      .sink { (completion) in
        switch completion {
          case .finished:
            print("finished!")
          case .failure(let error):
            print("There was an error. \(error)")
        }
        
      } receiveValue: { [weak self] (returnedPosts) in
        self?.posts = returnedPosts
      }
      .store(in: &cancellables)
    print("ㅎㅇ")
  }
  
  func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
    guard
      let response = output.response as? HTTPURLResponse,
      response.statusCode >= 200 && response.statusCode < 300 else {
        throw URLError(.badServerResponse)
      }
    return output.data
  }
  
}
struct DownloadWithCombine: View {
  
  @StateObject var vm = DownloadWithCombineViewModel()
  var body: some View {
    List{
      ForEach(vm.posts) { post in
        VStack {
          Text(post.title)
            .font(.headline)
          Text(post.body)
        }
      }
    }
  }
}

struct DownloadWithCombine_Previews: PreviewProvider {
  static var previews: some View {
    DownloadWithCombine()
  }
}
