//
//  Period.swift
//  OrientationObjectProject
//
//  Created by 더스틴 on 4/26/26.
//

import Foundation

class Period {
    
    let startDate: Date
    let endDate: Date
    
    var yearFraction: Double {
        Double(days) / 365.0
    }
    
    private var days: Int {
        Calendar.current.dateComponents([.day], from: startDate, to: endDate).day ?? 0
    }
    
    init(startDate: Date, endDate: Date) {
        self.startDate = startDate
        self.endDate = endDate
    }
    
    func isValidDate(_ date: Date) -> Bool {
        startDate <= date && endDate >= date
    }
}
