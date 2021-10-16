//
//  OrderListVIew.swift
//  CoffeeOrderingApp (iOS)
//
//  Created by 박승훈 on 2021/09/19.
//

import SwiftUI

struct OrderListVIew: View {

    let orders: [OrderViewModel]

    init(orders: [OrderViewModel]) {
        self.orders = orders
    }

    var body: some View {
        List {

            ForEach(self.orders, id: \.id) {
                order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(16)
                    
                    
                }
            }
        }

    }
}

struct OrderListVIew_Previews: PreviewProvider {
    static var previews: some View {
        OrderListVIew(orders: [OrderViewModel(order: Order(name: "name", size: "regular", coffeeName: "americano", total: 3.0))])
    }
}
