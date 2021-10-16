//
//  Coffee.swift
//  CoffeeOrderingApp (iOS)
//
//  Created by 박승훈 on 2021/09/11.
//

import Foundation

struct Coffee{
    
    let name: String
    let imageURL: String
    let price: Double
    
}

extension Coffee{
    
    static func all() -> [Coffee] {
        return [
                Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
                Coffee(name: "Espresso", imageURL: "Espresso", price: 2.1),
                Coffee(name: "Regular", imageURL: "Regular", price: 1.0)
            ]
    }
}
