//
//  InterestRate.swift
//  OrientationObjectProject
//
//  Created by 더스틴 on 4/26/26.
//

import Foundation

class InterestRate {
    
    let rate: Double
    
    init(rate: Double) {
        self.rate = rate
    }
    
    func calculateInterest(amount: Int, period: Period) -> Interest {
        let interestAmount = Double(amount) * rate * period.yearFraction
        
        return .init(amount: interestAmount, paymentDate: .now)
    }
}
