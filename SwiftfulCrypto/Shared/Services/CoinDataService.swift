//
//  CoinDataService.swift
//  SwiftfulCrypto (iOS)
//
//  Created by 박승훈 on 2021/12/25.
//

import Foundation
import Combine

class CoinDataService {
  
  @Published var allCoins: [CoinModel] = []
  //  var cancellables = Set<AnyCancellable>()
  
  var coinSubscription: AnyCancellable?
  
  init() {
    getCoins()
    print("AFTER: \(self.allCoins.first.debugDescription)")
  }
  
  private func getCoins() {
    guard let url = URL(string:
                          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
    
    coinSubscription = NetworkingManager.download(url: url)
      .decode(type: [CoinModel].self, decoder: JSONDecoder())
      .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnCoins) in
        self?.allCoins = returnCoins
        print("BEFORE CANCEL: \(returnCoins.first.debugDescription)")
//        self?.coinSubscription?.cancel()
        print("CoinDataService: cancel")
      })
  }
}
