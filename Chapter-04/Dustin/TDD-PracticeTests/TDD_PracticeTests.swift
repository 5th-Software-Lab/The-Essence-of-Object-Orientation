//
//  TDD_PracticeTests.swift
//  TDD-PracticeTests
//
//  Created by 더스틴 on 4/20/26.
//

import Testing
@testable import TDD_Practice

struct TDD_PracticeTests {

    @Test
    func 닉네임은_5자_이하여야_한다() {
        let string = "abcd12"
        let nickname = Nickname(string: string)
        
        let isValid = nickname.isValid()
        
        #expect(isValid == false)
    }
}
