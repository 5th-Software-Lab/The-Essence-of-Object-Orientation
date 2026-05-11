//
//  Coffee.swift
//  OrientationObjectProject
//
//  Created by 더스틴 on 4/28/26.
//

class Coffee {
    
    private let name: String
    private let price: Int
    
    init(menuItem: MenuItem) {
        self.name = menuItem.getName()
        self.price = menuItem.getPrice()
    }
    
    func getName() -> String {
        name
    }
}
