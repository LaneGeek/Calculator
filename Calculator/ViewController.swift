import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    let numberOfDigits = 12
    var stack = [Int]()
    var readyForNewEntry = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberButtonClicked(_ sender: UIButton) {
        if readyForNewEntry {
            readyForNewEntry = false
            displayLabel.text = sender.titleLabel!.text
            stack.append(Int(displayLabel.text!)!)
        } else if displayLabel.text!.count < numberOfDigits {
            displayLabel.text! += sender.titleLabel!.text!
            // eliminate leading zeros
            displayLabel.text! = String(Int(displayLabel.text!)!)
            stack[stack.count - 1] = Int(displayLabel.text!)!
        }
    }
    
    @IBAction func enterButtonClicked(_ sender: UIButton) {
        readyForNewEntry = true
    }
    
    @IBAction func dropButtonClicked(_ sender: UIButton) {
        if stack.count != 0 {
            stack.remove(at: stack.count - 1)
            readyForNewEntry = true
            if stack.count != 0 {
                displayLabel.text! = String(stack.last!)
            } else {
                displayLabel.text! = "Stack Empty"
            }
        }
    }
    
    @IBAction func operationButtonClicked(_ sender: UIButton) {
        if stack.count > 1 {
            let operand1 = stack[stack.count - 2]
            let operand2 = stack[stack.count - 1]
            let operation = sender.titleLabel!.text!
            
            var result: Int
            
            switch (operation) {
            case "÷":
                result = operand1 / operand2
            case "×":
                result = operand1 * operand2
            case "-":
                result = operand1 - operand2
            default:
                result = operand1 + operand2
            }
            
            // only perform the operation if there is no overflow
            if String(result).count <= numberOfDigits {
                stack.remove(at: stack.count - 1)
                stack[stack.count - 1] = result
                displayLabel.text! = String(result)
                readyForNewEntry = true
            }
        }
    }
}
