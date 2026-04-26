//
//  TimeDeposit.swift
//  OrientationObjectProject
//
//  Created by 더스틴 on 4/26/26.
//

import Foundation

class TimeDeposit {
    
    let period: Period
    private let account: Account
    
    init(period: Period, account: Account) {
        self.period = period
        self.account = account
    }
    
    func calculateInterest(date: Date) -> Interest? {
        guard period.isValidDate(date) else {
            return nil
        }
        
        return account.calculateInterest(period: period)
    }
}
