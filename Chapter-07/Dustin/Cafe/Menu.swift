//
//  Menu.swift
//  OrientationObjectProject
//
//  Created by 더스틴 on 4/28/26.
//

class Menu {
    
    private let items: [MenuItem]
    
    init(items: [MenuItem]) {
        self.items = items
    }
    
    func findMenuItem(menuName: String) -> MenuItem? {
        let item = items.first { $0.isSameName(menuName) }
        guard let item else {
            return nil
        }
        
        return item
    }
}
