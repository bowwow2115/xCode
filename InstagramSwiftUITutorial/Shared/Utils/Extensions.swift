//
//  Extensions.swift
//  InstagramSwiftUITutorial (iOS)
//
//  Created by 박승훈 on 2021/10/10.
//

import Foundation
import UIKit

extension UIApplication {
  func endEditing(){
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
