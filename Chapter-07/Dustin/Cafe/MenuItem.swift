//
//  MenuItem.swift
//  OrientationObjectProject
//
//  Created by 더스틴 on 4/28/26.
//

class MenuItem {
    
    private let name: String
    private let price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func isSameName(_ name: String) -> Bool {
        self.name == name
    }
    
    func getName() -> String {
        name
    }
    
    func getPrice() -> Int {
        price
    }
}
