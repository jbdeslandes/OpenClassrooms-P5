//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    var calculate = Calculate()

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calculate.addNewNumber(i)
            }
        }
    }

    @IBAction func plus() {
        if calculate.canAddOperator {
        	calculate.operators.append("+")
        	calculate.stringNumbers.append("")
            calculate.updateDisplay()
        }
    }

    @IBAction func minus() {
        if calculate.canAddOperator {
            calculate.operators.append("-")
            calculate.stringNumbers.append("")
            calculate.updateDisplay()
        }
    }

    @IBAction func equal() {
        calculate.calculateTotal()
    }

}
