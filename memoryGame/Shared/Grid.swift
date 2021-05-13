//
//  Grid.swift
//  memoryGame
//
//  Created by 박승훈 on 2021/04/22.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView

    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) { //호출 되지 않아도 초기화럴 작동할 수 있게끔 한다.
        self.items = items
        self.viewForItem = viewForItem
    }
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }

    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }

    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)
        return Group{ // viewbuilder 를 반환해야하는데 모든 경우를 가지지 않는 조건문에 의해 반환을 하지 못할 경우가 생겨 오류가 나므로 전체를 그룹으로 묶어 반환캐 한다.
            if index != nil {
            viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: index!))
            }
        }
        
    }
}

