//
//  UIApplication.swift
//  SwiftfulCrypto (iOS)
//
//  Created by 박승훈 on 2022/01/01.
//

import Foundation
import UIKit

extension UIApplication {
  
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
