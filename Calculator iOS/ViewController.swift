//
//  ViewController.swift
//  Calculator iOS
//
//  Created by Stuart Wells on 5/20/18.
//  Copyright © 2018 Stuart Wells. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var OutputLabel: UILabel!
    
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override var preferredStatusBarStyle:
        UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func handleButtonPress(_ sender: UIButton) {
        if canClear {
            OutputLabel.text = ""
            canClear = false
    }
    let currentText = OutputLabel.text!
    let textLabel = sender.titleLabel?.text
        if let text = textLabel {
        switch text {
        case "+", "*","/","-":
            if hasOp {
                return
            }
            op = text
            isFirstNumber = false
            hasOp = true
            OutputLabel.text = "\(currentText) \(op) "
            break
        default:
            if isFirstNumber{
                firstNumberText = "\(firstNumberText)\(text)"
            } else {
                secondNumberText = "\(secondNumberText)\(text)"
            }
            OutputLabel.text = "\(currentText)\(text)"
            break;
            }
        }
    }
    
    
    


func calculate() -> Double {
    let firstNumber = Double(firstNumberText)!
    let secondNumber = Double(secondNumberText)
    firstNumberText = ""
    secondNumberText = ""
    switch op {
    case "+":
        return firstNumber + secondNumber!
    case "-":
        return firstNumber - secondNumber!
    case "/":
        return firstNumber / secondNumber!
    case "*":
        return firstNumber * secondNumber!
    default:
        return 0
        
    }
    
  }

}



