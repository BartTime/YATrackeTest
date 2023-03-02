//
//  PasswordStatusViewTests.swift
//  PasswordSecondTests
//
//  Created by Alex on 28.02.2023.
//

import XCTest

@testable import PasswordSecond

class PasswordStatusViewTest_ShowCheckmarkOrReset_When_Validation_Is_Inline: XCTestCase {
    
    var statusView: PasswordStausView!
    var validPassword = "12345678Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStausView()
        statusView.shouldResetCriteria = true
    }
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lenghtCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lenghtCriteriaView.isCheckMarkImage)
    }
    
    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lenghtCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lenghtCriteriaView.isResetImage)
    }
}

class PasswordStatusViewTests_ShowCheckmarkOrRedX_When_Validation_Is_Loss_Of_Focus: XCTestCase {
    var statusView: PasswordStausView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStausView()
        statusView.shouldResetCriteria = false
    }
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lenghtCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lenghtCriteriaView.isCheckMarkImage)
    }
    
    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lenghtCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lenghtCriteriaView.isXmarkImage )
    }
    
}
