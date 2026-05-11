//
//  Interest.swift
//  OrientationObjectProject
//
//  Created by 더스틴 on 4/26/26.
//

import Foundation

class Interest: Equatable {
    
    private let amount: Double
    private let paymentDate: Date
    
    static func == (lhs: Interest, rhs: Interest) -> Bool {
        lhs.amount == rhs.amount && lhs.paymentDate == rhs.paymentDate
    }
    
    init(amount: Double, paymentDate: Date) {
        self.amount = amount
        self.paymentDate = paymentDate
    }
}
