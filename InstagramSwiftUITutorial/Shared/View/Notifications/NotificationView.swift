//
//  NotificationView.swift
//  InstagramSwiftUITutorial
//
//  Created by 박승훈 on 2021/10/09.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
      ScrollView{
        LazyVStack{
          ForEach(1 ..< 20) { _ in
            NotificationCell()
              .padding(.top)
          }
        }
      }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
