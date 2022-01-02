//
//  DownloadingImages.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/19.
//

import SwiftUI

struct DownloadingImagesBootcamp: View {
  
  @StateObject var vm = DownloadingImageViewModel()
  
    var body: some View {
      NavigationView {
        List {
          ForEach(vm.dataArray) { model in
            DownloadingImagesRow(model: model)
          }
        }
        .navigationTitle("Downloading Images!")
      }

    }
}

struct DownloadingImages_Previews: PreviewProvider {
    static var previews: some View {
      DownloadingImagesBootcamp()
    }
  
}

