import UIKit
import JavaScriptCore

class ViewController: UIViewController {
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var textView: UITextView!
  
  let context = JSContext()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func exec(sender: AnyObject) {
    let cmd = textField.text!
    textField.text = ""
    
    let value = context?.evaluateScript(cmd)
    
    textView.text = textView.text!
      + "\n> " + cmd
      + "\n " + value!.toString()
    
    textView.scrollRangeToVisible(
      NSMakeRange(textView.text.characters.count-1, 1))
  }
}

