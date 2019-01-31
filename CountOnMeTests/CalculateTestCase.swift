//
//  CalculateTestCase.swift
//  CountOnMeTests
//
//  Created by Jean-Baptiste Deslandes on 28/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculateTestCase: XCTestCase {
    
    var calculate: Calculate!

    override func setUp() {
        super.setUp()
        calculate = Calculate()
    }

    func testGivenStringNumbersIsEmpty_WhenAddingNumberTen_ThenStringNumbersgGetsNumberTen() {
        // When
        calculate.addNewNumber(10)
        
        // Then
        XCTAssert(calculate.stringNumbers.last == "10")
    }
    
    func testGivenOperationIs10Minus8_WhenCalculatingTotal_ThenTotalEqual2() {
        // Given
        calculate.addNewNumber(10)
        calculate.operators.append("-")
        calculate.stringNumbers.append("")
        calculate.addNewNumber(8)

        // When
        calculate.calculateTotal()
        
        // Then
        XCTAssertEqual(calculate.total, 2)
        XCTAssert(calculate.operators.last! == "-")
        XCTAssertTrue(calculate.isExpressionCorrect)
    }
    
    func testGivenOperationIs2MultipliedBy4DividedBy8_WhenCalculatingTotal_ThenTotalEqual1() {
        // Given
        calculate.addNewNumber(2)
        calculate.operators.append("x")
        calculate.stringNumbers.append("")
        calculate.addNewNumber(4)
        calculate.operators.append("/")
        calculate.stringNumbers.append("")
        calculate.addNewNumber(8)
        
        // When
        calculate.calculateTotal()
        
        // Then
        XCTAssertEqual(calculate.total, 1)
        XCTAssert(calculate.operators.last! == "/")
        XCTAssertTrue(calculate.isExpressionCorrect)
    }
    
    func testGivenOperationIs10PlusMinus_WhenCalculatingTotal_ThenIsExpressionCorrectIsFalse() {
        // Given
        calculate.addNewNumber(10)
        calculate.operators.append("+")
        calculate.operators.append("-")
        calculate.stringNumbers.append("")
        
        // When
        calculate.calculateTotal()
        
        // Then
        XCTAssertFalse(calculate.isExpressionCorrect)
        XCTAssertTrue(calculate.errorAlert)
    }
    
    func testGivenOperationIs2Plus2_WhenCalculatingTotal_ThenUdpdateDisplayShouldSay2plus2Equals4() {
        // Given
        calculate.addNewNumber(2)
        calculate.operators.append("+")
        calculate.stringNumbers.append("")
        calculate.addNewNumber(2)
        
        // When
        calculate.calculateTotal()
        
        // Then
        XCTAssertEqual(calculate.total, 4)
        XCTAssert(calculate.operators.last! == "+")
        XCTAssertTrue(calculate.isExpressionCorrect)
        XCTAssertEqual(calculate.updateDisplay(), "2+2")
        
       
    }
    
    func testGivenTotalIs2_WhenStartingNewCalculation_ThenClear() {
        // Given
        calculate.addNewNumber(2)
        calculate.calculateTotal()
        
        // When
        calculate.clear()
        
        // Then
        XCTAssertEqual(calculate.operators.last!, "+")
        XCTAssert(calculate.stringNumbers.last! == "")
        XCTAssertFalse(calculate.isExpressionCorrect)
        XCTAssertTrue(calculate.errorAlert)
    }
    
    func testGivenOperationIs7DividedBy0_WhenCalculateTotal_ThenShouldReturnError() {
        // Given
        calculate.addNewNumber(7)
        calculate.operators.append("/")
        calculate.stringNumbers.append("")
        calculate.addNewNumber(0)
        
        // When
        calculate.calculateTotal()
        
        // Then
        XCTAssertEqual(calculate.operators.last!, "/")
        XCTAssertFalse(calculate.isExpressionCorrect)
        XCTAssertTrue(calculate.errorAlert)
    }

}
