//
//  Calculate.swift
//  CountOnMe
//
//  Created by Jean-Baptiste Deslandes on 26/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculate {
    
    // MARK: - Properties
    
    var total: Int = 0
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        return true
    }
    
    // (BONUS 4 - To Keep operations clearable)
    var isNumberTooLong: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.count > 9 {
                return true
            }
        }
        return false
    }
    
    // MARK: - Methods
    
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    func calculateTotal() {
        if !isExpressionCorrect {
            return
        }
        
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }

    }
    
    func updateDisplay() -> String {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        return text
    }
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        total = 0
    }
    
}
