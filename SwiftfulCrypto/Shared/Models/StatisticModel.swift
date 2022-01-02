//
//  StatisticModel.swift
//  SwiftfulCrypto (iOS)
//
//  Created by 박승훈 on 2022/01/01.
//

import Foundation

struct StatisticModel: Identifiable {
  
  let id = UUID().uuidString
  let title: String
  let value: String
  let percentageChange: Double?
  
  init(title: String, value: String, percentageChange: Double? = nil) {
    self.title = title
    self.value = value
    self.percentageChange = percentageChange
  }
  
}

//let newModel = StatisticModel(title: "", value: "", percentageChange: nil)
