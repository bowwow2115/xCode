//
//  DownloadingImageView.swift
//  Gestures (iOS)
//
//  Created by 박승훈 on 2021/12/19.
//

import SwiftUI

struct DownloadingImageView: View {
  
  @StateObject var loader: ImageLoadingViewModel
  
  init(url: String, key: String) {
    // '_' = property Wrapper
    _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
  }
  
    var body: some View {
      ZStack {
        if loader.isLoading {
          ProgressView()
        } else if let image = loader.image {
          Image(uiImage: image)
            .resizable()
            .clipShape(Circle())
        }
      }
    }
}

struct DownloadingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImageView(url: "https://via.placeholder.com/600/92c952",key: "1")
        .frame(width: 75, height: 75)
        .previewLayout(.sizeThatFits)
    }
}
