//
//  ViewModel.swift
//  StateAndObservedObject
//
//  Created by 박승훈 on 2021/10/02.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var name = "Sam"
    
    func changeName(){
        self.name = "Adam"
    }
}
