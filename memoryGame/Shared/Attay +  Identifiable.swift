//
//  Attay +  Identifiable.swift
//  memoryGame
//
//  Created by 박승훈 on 2021/04/24.
//

import Foundation


extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
