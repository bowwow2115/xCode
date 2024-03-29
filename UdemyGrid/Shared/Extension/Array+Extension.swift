//
//  Arrat+Extension.swift
//  UdemyGrid
//
//  Created by 박승훈 on 2021/08/12.
//

import Foundation

extension Array {
    func chunks(size: Int) -> [ArraySlice<Element>] {
        var chunks: [ArraySlice<Element>] = [ArraySlice<Element>]()
        
        for index in stride(from: 0, to: self.count-1, by: size){
            var chunk = ArraySlice<Element>()
            let end = index + size
            
            if end >= self.count {
                chunk = self[index..<self.count]
            } else {
                chunk = self[index..<end]
            }
            
            chunks.append(chunk)
            
            if(end+1) == self.count {
                let remainingChink = self[end..<self.count]
                chunks.append(remainingChink)
            }
        }
        return chunks
    }
}
