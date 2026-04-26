//
//  Account.swift
//  OrientationObjectProject
//
//  Created by 더스틴 on 4/26/26.
//

import Foundation

class Account {
    
    private let interestRate: InterestRate
    private var amount: Int
    
    init(interestRate: InterestRate, amount: Int) {
        self.interestRate = interestRate
        self.amount = amount
    }
    
    func calculateInterest(period: Period) -> Interest {
        interestRate.calculateInterest(amount: amount, period: period)
    }
}
