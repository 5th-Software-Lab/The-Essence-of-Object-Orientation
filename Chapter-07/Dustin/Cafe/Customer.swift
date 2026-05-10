//
//  Customer.swift
//  OrientationObjectProject
//
//  Created by 더스틴 on 4/28/26.
//

class Customer {
    
    private let menu: Menu
    private let barista: Barista
    
    init(menu: Menu, barista: Barista) {
        self.menu = menu
        self.barista = barista
    }
    
    func order(menuName: String) -> String {
        guard let item = menu.findMenuItem(menuName: menuName) else {
            return "메뉴판에 메뉴가 없습니다."
        }
        
        let coffee = barista.makeCoffee(menuItem: item)
        return "주문하신 \(coffee.getName()) 나왔습니다!"
    }
}
