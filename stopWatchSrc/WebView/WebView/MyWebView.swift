//
//  MyWebView.swift
//  WebView
//
//  Created by 박승훈 on 2021/03/29.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    //uiview 만들기
    
    //업데이트 ui view
    var urlToLoad: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        webview.load(URLRequest(url: url))
                                
                                }
    }
}
