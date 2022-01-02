//
//  HomeViewModel.swift
//  SwiftfulCrypto (iOS)
//
//  Created by 박승훈 on 2021/12/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
  
  var statistic: [StatisticModel] = [
    StatisticModel(title: "title", value: "value", percentageChange: 1),
    StatisticModel(title: "title", value: "value"),
    StatisticModel(title: "title", value: "value", percentageChange: 10),
    StatisticModel(title: "title", value: "value", percentageChange: -7)
  ]
  
  @Published var allCoins: [CoinModel] = []
  @Published var portfolioCoins: [CoinModel] = []
  
  @Published var searchText: String = ""
  
  private let coinDataService = CoinDataService()
  private let marketDataService = MarketDataService()
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    addSubscribers()
  }
  
  func addSubscribers() {
//    dataService.$allCoins
//      .sink { [weak self] (returnedCoins) in
//        self?.allCoins = returnedCoins
//      }
//      .store(in: &cancellables)
    
    // updates allCoins
    $searchText
      .combineLatest(coinDataService.$allCoins)
      .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
      .map(filterCoins)
      .sink { [weak self] (returnedCoin) in
        self?.allCoins = returnedCoin
      }
      .store(in: &cancellables)
    
    marketDataService.$marketData
      .map(mapGlobalMarketData)
      .sink {[weak self] (returnedStats) in
        self?.statistic = returnedStats
      }
      .store(in: &cancellables)
  }
  
  private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
//    print("FILTER COINS: \(coins)")
    let lowercasedText = text.lowercased()
    
    let filteredCoins = coins.filter { (coin) -> Bool in
      return coin.name.lowercased().contains(lowercasedText) ||
        coin.symbol.lowercased().contains(lowercasedText) ||
        coin.id.lowercased().contains(lowercasedText)
    }
    return filteredCoins
  }
  
  private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticModel] {
    var stats: [StatisticModel] = []
    
    guard let data = marketDataModel else {
      return stats
    }
    
    let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
    let volume = StatisticModel(title: "24h Volume", value: data.volume)
    let btcDominance = StatisticModel(title: "BTC Dominace", value: data.btcDominance)
    let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
    
    stats.append(contentsOf: [
      marketCap,
      volume,
      btcDominance,
      portfolio
    ])
    return stats
  }
  
}


