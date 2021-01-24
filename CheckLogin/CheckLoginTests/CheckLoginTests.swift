//
//  CheckLoginTests.swift
//  CheckLoginTests
//
//  Created by Alex Bro on 28.09.2020.
//

import XCTest
@testable import CheckLogin

class CheckLoginTests: XCTestCase {
    
    var login = "foo"
    var loginValidate = LoginValidateImpl()
    
//MARK: - Testing "isAllowed"
    func testLoginIsCorrect() {
        login = "login1.-@Mail.ru"
        XCTAssertTrue(loginValidate.isAllowed(withLogin: login))
    }
    
    func testLoginContainsLessThanThreeChars() {
        login = "fo"
        XCTAssertFalse(loginValidate.isAllowed(withLogin: login))
    }
    
    func testLoginContainsMoreThanThirtyTwoChars() {
        login = "foofoofoofoofoofoofoofoofoofoofoo"
        XCTAssertFalse(loginValidate.isAllowed(withLogin: login))
    }
    
    func testLoginDoesNotContainNumbersAtTheBeginning() {
        login = "1foo"
        XCTAssertFalse(loginValidate.isAllowed(withLogin: login))
    }
    
    func testLoginDoesNotContainPeriodAtTheBeginning() {
        login = ".foo"
        XCTAssertFalse(loginValidate.isAllowed(withLogin: login))
    }
    
    func testLoginDoesNotContainMinusAtTheBeginning() {
        login = "-foo"
        XCTAssertFalse(loginValidate.isAllowed(withLogin: login))
    }
    
    func testLoginCanConsistOfLatinLettersNumbersMinusAndPeriod() {
        login = "foo1-."
        XCTAssertTrue(loginValidate.isAllowed(withLogin: login))
    }
}
