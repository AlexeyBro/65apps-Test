//
//  CheckLoginTests.swift
//  CheckLoginTests
//
//  Created by Alex Bro on 28.09.2020.
//

import XCTest
@testable import CheckLogin

class MockLoginValidate: LoginValidate {
    
    func isAllowed(withLogin login: String?) -> Bool {
        let regex = "^((?!([0-9/./-]))[a-zA-Z0-9/@/./-]{3,32})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: login)
    }
}

class CheckLoginTests: XCTestCase {
    
    var login = "foo"
    var loginValidate: MockLoginValidate!
    
    override func setUp() {
        super.setUp()
        loginValidate = MockLoginValidate()
    }
    
    override func tearDown() {
        super.tearDown()
        loginValidate = nil
    }
    
//MARK: - Mock object not nil
    func testObjectNotNil() {
        XCTAssertNotNil(loginValidate, "LoginValidate not nil")
    }
    
//MARK: - Login is allowed"
    func testLoginIsCorrect() {
        let givenLogin = "test@mail.ru"
        let result = loginValidate.isAllowed(withLogin: givenLogin)
        XCTAssertTrue(result, "Login is correct")
    }
    
    func testLoginContainsLessThanThreeChars() {
        let givenLogin = "po"
        let result = loginValidate.isAllowed(withLogin: givenLogin)
        XCTAssertFalse(result, "Login should be more 2 characters")
    }
    
    func testLoginContainsMoreThanThirtyTwoChars() {
        let givenLogin = "foofoofoofoofoofoofoofoofoofoofoo"
        let result = loginValidate.isAllowed(withLogin: givenLogin)
        XCTAssertFalse(result, "Login cannot be more than 32 characters")
    }
    
    func testLoginDoesNotContainNumbersAtTheBeginning() {
        let givenLogin = "1foo"
        let result = loginValidate.isAllowed(withLogin: givenLogin)
        XCTAssertFalse(result, "Login cannot start with a number")
    }
    
    func testLoginDoesNotContainPeriodAtTheBeginning() {
        let givenLogin = ".foo"
        let result = loginValidate.isAllowed(withLogin: givenLogin)
        XCTAssertFalse(result, "Login cannot start with a dot")
    }
    
    func testLoginDoesNotContainMinusAtTheBeginning() {
        let givenLogin = "-foo"
        let result = loginValidate.isAllowed(withLogin: givenLogin)
        XCTAssertFalse(result, "Login cannot start with a minus")
    }
    
    func testLoginCanConsistOfLatinLettersNumbersMinusAndPeriod() {
        let givenLogin = "foo1-."
        let result = loginValidate.isAllowed(withLogin: givenLogin)
        XCTAssertTrue(result, "Login can contain latin letters, numbers, minus and dot")
    }
}
