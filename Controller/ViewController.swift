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
    
    // MARK: - Methods
    
    func errorChecking(_ type: Int) {
            switch type {
            case 1:
                let alertVC = UIAlertController(title: "Erreur!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            case 2:
                let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            case 3:
                let alertVC = UIAlertController(title: "Erreur!", message: "Entrez un nombre de 10 chiffres maximum !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            default:
                print("Error alert crashes")
            }
    }
    
    func displayResult() {
        if calculate.isExpressionCorrect {
            calculate.calculateTotal()
        } else {
            errorChecking(1)
        }
        
        // (BONUS 1 - Continue operation in progress & refresh total value)
        if !calculate.updateDisplay().isEmpty {
            totalView.text = "= \(calculate.total)"
            calculate.total = 0
        }
    }
    
    func manageOperator(_ type: String) {
        if calculate.isExpressionCorrect {
            calculate.operators.append("\(type)")
            calculate.stringNumbers.append("")
            textView.text = calculate.updateDisplay()
        } else {
            errorChecking(2)
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var totalView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // MARK: - Actions
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                if !calculate.isNumberTooLong {
                    calculate.addNewNumber(i)
                    textView.text = calculate.updateDisplay()
                } else {
                    errorChecking(3)
                }
            }
            // (BONUS 3 - Automatic Scrolling during operation)
            let range = NSMakeRange(textView.text.count - 1, 0)
            textView.scrollRangeToVisible(range)
        }
    }
    
    @IBAction func plus() {
        manageOperator("+")
    }
    
    @IBAction func minus() {
        manageOperator("-")
    }
    
    @IBAction func equal() {
        displayResult()
    }
    
    // (BONUS 2 - Clear button to reset total & operation)
    @IBAction func clear() {
        calculate.clear()
        totalView.text = "= 0"
        textView.text = ""
    }
    
}
