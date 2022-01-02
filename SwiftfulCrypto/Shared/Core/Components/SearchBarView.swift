//
//  SearchBarView.swift
//  SwiftfulCrypto (iOS)
//
//  Created by 박승훈 on 2022/01/01.
//

import SwiftUI

struct SearchBarView: View {
  
  @Binding var searchText: String
  
    var body: some View {
      HStack {
        Image(systemName: "magnifyingglass")
          .foregroundColor(
            searchText.isEmpty ?
              .theme.secondaryText : .theme.accent)
        
        TextField("Search by name or symbol...", text: $searchText)
          .foregroundColor(.theme.accent)
          .overlay(
            Image(systemName: "xmark.circle.fill")
              .padding()
              .offset(x: 10)
              .foregroundColor(.theme.accent)
              .opacity(searchText.isEmpty ? 0.0 : 1.0)
              .onTapGesture {
                UIApplication.shared.endEditing()
                searchText = ""
              }
//              .background(Color.red)
            ,alignment: .trailing
          )
      }
      .font(.headline)
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 25)
          .fill(Color.theme.background)
          .shadow(color: .theme.accent.opacity(0.15),
                  radius: 10,
                  x: 0,
                  y: 0)
      )
      .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        SearchBarView(searchText: .constant(""))
          .previewLayout(.sizeThatFits)
          .preferredColorScheme(.light)
        
        SearchBarView(searchText: .constant(""))
          .previewLayout(.sizeThatFits)
          .preferredColorScheme(.dark)
      }
        
    }
}
