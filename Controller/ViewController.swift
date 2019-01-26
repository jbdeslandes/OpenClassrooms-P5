//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    var calculate = Calculate()
    
//    var stringNumbers: [String] = [String()]
//    var operators: [String] = ["+"]
//    var index = 0
//    var isExpressionCorrect: Bool {
//        if let stringNumber = stringNumbers.last {
//            if stringNumber.isEmpty {
//                if stringNumbers.count == 1 {
//                    let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
//                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                    self.present(alertVC, animated: true, completion: nil)
//                } else {
//                    let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
//                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                    self.present(alertVC, animated: true, completion: nil)
//                }
//                return false
//            }
//        }
//        return true
//    }
    
//    var canAddOperator: Bool {
//        if let stringNumber = stringNumbers.last {
//            if stringNumber.isEmpty {
//                let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
//                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                self.present(alertVC, animated: true, completion: nil)
//                return false
//            }
//        }
//        return true
//    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // MARK: - Actions
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calculate.addNewNumber(i)
                textView.text = calculate.updateDisplay()
            }
        }
    }
    
    @IBAction func plus() {
        if calculate.canAddOperator {
            calculate.operators.append("+")
            calculate.stringNumbers.append("")
            textView.text = calculate.updateDisplay()
        }
    }
    
    @IBAction func minus() {
        if calculate.canAddOperator {
            calculate.operators.append("-")
            calculate.stringNumbers.append("")
            textView.text = calculate.updateDisplay()
        }
    }
    
    @IBAction func equal() {
        calculate.calculateTotal()
        textView.text = "\(calculate.total)"
        calculate.clear()
    }
    
}
