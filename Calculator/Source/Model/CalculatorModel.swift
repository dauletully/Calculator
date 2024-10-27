import UIKit

protocol CalculatorProtocol {
    func perfomOperation(_ operation: String, with operand: Double) -> String
    func reset()
}
var currentResult: Double = 0
class CalculatorModel: CalculatorProtocol {

    func perfomOperation(_ operation: String, with operand: Double) -> String {
        switch operation {
        case "*":
            currentResult *= operand
        case "+":
            currentResult += operand
        case "-":
            currentResult -= operand
        case "/":
            currentResult /= operand
        default:
            break
        }
        print(currentResult)

        if currentResult.truncatingRemainder(dividingBy: 1) == 0 {
                return String(format: "%.0f", currentResult)
            } else {
                return "\(currentResult)"
            }
    }

    func reset() {
        currentResult = 0
    }
}

