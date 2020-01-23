import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    let numberOfDigits = 8
    var stack = [Int]()
    var stackEntryJustMade = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberButtonClicked(_ sender: UIButton) {
        if displayLabel.text == "Stack Empty" || stackEntryJustMade {
            displayLabel.text = sender.titleLabel!.text
            stackEntryJustMade = false
        } else if displayLabel.text!.count < 8 {
            displayLabel.text! += sender.titleLabel!.text!
        }
    }
    
    @IBAction func zeroButtonClicked(_ sender: UIButton) {
        if !stackEntryJustMade {
            if displayLabel.text != "Stack Empty" && displayLabel.text!.count < 8 {
                displayLabel.text! += "0"
            }
        }
    }
    
    @IBAction func enterButtonClicked(_ sender: UIButton) {
        if displayLabel.text != "Stack Empty" {
            stack.append(Int(displayLabel.text!)!)
            stackEntryJustMade = true
        }
    }
    
    @IBAction func operationButtonClicked(_ sender: UIButton) {
        if stack.count != 0 {
            let operand1 = stack.last!
            let operand2 = Int(displayLabel.text!)!
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
            
            stack[stack.count - 1] = result
            displayLabel.text! = String(result)
            stackEntryJustMade = true
        }
    }
}
