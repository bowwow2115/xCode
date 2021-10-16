//
//  Hike.swift
//  Udemy (iOS)
//
//  Created by 박승훈 on 2021/08/10.
//

import Foundation

struct Hike {
   
    let name: String
    let imageURL: String
    let miles: Double
    
}

extension Hike {
    
    static func all() -> [Hike]{
        return[
            Hike(name: "Salmoneyberry Trail", imageURL: "sal", miles: 6),
            Hike(name: "Tom, Dick, and Harry Mountain", imageURL: "tom", miles: 5),
            Hike(name: "tamanawas Falls", imageURL: "tam", miles: 5)
        ]
    }
}
