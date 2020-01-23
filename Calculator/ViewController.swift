import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    let numberOfDigits = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberButtonClicked(_ sender: UIButton) {
        if displayLabel.text == "Stack Empty" {
            displayLabel.text = sender.titleLabel!.text
        } else {
            if displayLabel.text!.count < 8 {
                displayLabel.text! += sender.titleLabel!.text!
            }
        }
    }
    
    @IBAction func zeroButtonClicked(_ sender: UIButton) {
        if displayLabel.text != "Stack Empty" {
            if displayLabel.text!.count < 8 {
                displayLabel.text! += "0"
            }
        }
        
    }
    
    @IBAction func enterButtonClicked(_ sender: UIButton) {
    }
    
    
    @IBAction func operationButtonClicked(_ sender: UIButton) {
        
        
        
    }
    
}

