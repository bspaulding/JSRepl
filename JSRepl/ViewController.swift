import UIKit
import JavaScriptCore

class ViewController: UIViewController {
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var textView: UITextView!
  
  let context = JSContext()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    context?.exceptionHandler = { context, value in
      if context === self.context, let value = value {
          self.append(value.toString())
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func exec(_ sender: AnyObject) {
    let cmd = textField.text!
    textField.text = ""
    
    let value = context?.evaluateScript(cmd)
    
    append("> " + cmd)
    append(value!.toString())
    
    textView.scrollRangeToVisible(
      NSMakeRange(textView.text.characters.count-1, 1))
  }
  
  private func append(_ string: String) {
    textView.text = "\n" + string + textView.text!
  }
}

