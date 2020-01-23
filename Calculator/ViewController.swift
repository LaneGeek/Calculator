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
        
    }
    
}
