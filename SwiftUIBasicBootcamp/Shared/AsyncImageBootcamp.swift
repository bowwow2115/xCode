//
//  AsyncImageBootcamp.swift
//  SwiftUIBasicBootcamp
//
//  Created by 박승훈 on 2021/12/20.
//

import SwiftUI

struct AsyncImageBootcamp: View {
  
  let url = URL(string: "https://picsum.photos/200")
  
  var body: some View {
    
    AsyncImage(url: url) { phase in
      switch phase {
        case .empty:
          ProgressView()
        case .success(let returnedImage):
          returnedImage
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .cornerRadius(20)
        case .failure:
          Image(systemName: "questionmark")
            .font(.headline)
//        default:
//          Image(systemName: "questionmark")
//            .font(.headline)
      }
    }
    
//    AsyncImage(url: url, content: { returnedImage in
//      returnedImage
//        .resizable()
//        .scaledToFit()
//        .frame(width: 100, height: 100)
//        .cornerRadius(20)
//    }, placeholder: {
//      ProgressView()
//    })
//      .frame(width: 100, height: 100)
  }
}

struct AsyncImageBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    AsyncImageBootcamp()
  }
}
