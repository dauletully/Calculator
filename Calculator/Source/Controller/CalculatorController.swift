//
//  CalculatorController.swift
//  Calculator
//
//  Created by Dinmukhammed Begaly on 27.10.2024.
//

import UIKit

class CalculatorController: UIViewController {

    let calculatorView = CalculatorView()
    let calculatorModel = CalculatorModel()
    private lazy var currentOperand: String = ""
    private lazy var currentOperation: String = ""

    override func loadView() {
            view = calculatorView
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCallBack()
    }

    private func setupCallBack() {
        calculatorView.buttonTupped = {[weak self] symbol in
            guard let self = self else {return}

            switch symbol{
            case "0"..."9", ",":
                self.currentOperand += symbol
                self.calculatorView.getTitle(currentOperand)
            case "+", "-", "*", "/":
                if let operand = Double(currentOperand) {
                    self.currentOperation = symbol
                    self.currentOperand = ""
                    self.calculatorView.getTitle("\(self.calculatorModel.perfomOperation(symbol, with: operand))")
                }
            case "=":
                if let operand = Double(currentOperand) {
                    let res = self.calculatorModel.perfomOperation(currentOperation, with: operand)
                    self.calculatorView.getTitle("\(res)")
                    self.currentOperand = "\(res)"
                    self.currentOperation = ""
                }
            case "C":
                self.calculatorView.getTitle("0")
                self.calculatorModel.reset()
                self.currentOperand = ""
                self.currentOperation = ""
            default:
                self.calculatorModel.reset()
                self.calculatorView.getTitle("0")
                self.currentOperand = ""
                self.currentOperation = ""
            }

        }
    }

}
