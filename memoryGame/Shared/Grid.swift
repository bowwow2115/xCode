//
//  Grid.swift
//  memoryGame
//
//  Created by 박승훈 on 2021/04/22.
//

import SwiftUI

struct Grid<Item, ItemView>: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView

    init(_ items: [Item], viewForItem: (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }

    var body: some View {
        Text("hello")
    }

}

