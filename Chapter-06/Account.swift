//
//  Account.swift
//  OrientationObjectProject
//
//  Created by 더스틴 on 4/26/26.
//

import Foundation

class Account {
    
    let interestRate: InterestRate
    let amount: Int
    
    init(interestRate: InterestRate, amount: Int) {
        self.interestRate = interestRate
        self.amount = amount
    }
    
    func calculateInterest(period: Period) -> Interest {
        interestRate.calculateInterest(amount: amount, period: period)
    }
}
