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
    
    func errorAlert(_ type: Int) {
        if calculate.errorAlert {
            switch type {
            case 1:
                if calculate.stringNumbers.last!.isEmpty {
                    let alertVC = UIAlertController(title: "Erreur!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                }
            case 2:
                let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            default:
                print("Error alert crashes")
            }
        }
    }
    
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
        if calculate.isExpressionCorrect {
            calculate.operators.append("+")
            calculate.stringNumbers.append("")
            textView.text = calculate.updateDisplay()
        } else {
            errorAlert(2)
        }
    }
    
    @IBAction func minus() {
        if calculate.isExpressionCorrect {
            calculate.operators.append("-")
            calculate.stringNumbers.append("")
            textView.text = calculate.updateDisplay()
        } else {
            errorAlert(2)
        }
    }
    
    @IBAction func equal() {
        errorAlert(1)
        calculate.calculateTotal()
        if !calculate.updateDisplay().isEmpty && calculate.isExpressionCorrect {
            textView.text = "\(calculate.updateDisplay()) = \(calculate.total)"
        }
        calculate.clear()
    }
    
}
