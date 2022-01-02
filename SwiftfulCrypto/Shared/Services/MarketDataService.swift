//
//  MarketDataService.swift
//  SwiftfulCrypto (iOS)
//
//  Created by 박승훈 on 2022/01/02.
//

import Foundation
import Combine

class MarketDataService {
  
  @Published var marketData: MarketDataModel? = nil
  //  var cancellables = Set<AnyCancellable>()
  
  var marketDataSubscription: AnyCancellable?
  
  init() {
    getData()
  }
  
  private func getData() {
    guard let url = URL(string:
                          "https://api.coingecko.com/api/v3/global") else { return }
    
    marketDataSubscription = NetworkingManager.download(url: url)
      .decode(type: GlobalData.self, decoder: JSONDecoder())
      .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
        self?.marketData = returnedGlobalData.data
        self?.marketDataSubscription?.cancel()
      })
  }
}
