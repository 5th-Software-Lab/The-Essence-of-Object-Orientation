//
//  Nickname.swift
//  TDD-Practice
//
//  Created by 더스틴 on 4/20/26.
//

import Foundation

class Nickname {
    
    private let limitCount = 5
    let string: String
    
    init(string: String) {
        self.string = string
    }
    
    func isValid() -> Bool {
        return string.count <= limitCount
    }
}
