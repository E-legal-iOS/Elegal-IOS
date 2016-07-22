//
//  ViewController.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 18/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var textFieldEmail: UITextField!
   @IBOutlet weak var textFieldPassword: UITextField!

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      navigationController?.navigationBarHidden = true
   }

   @IBAction func createAccount (sender: UIButton) {
      performSegueWithIdentifier("", sender: self)
   }

   @IBAction func linkedIn (sender: UIButton) {

   }

   @IBAction func login (sender: UIButton) {

   }

   func isValidEmail(testStr: String) -> Bool {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
      let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
      return emailTest.evaluateWithObject(testStr)
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

   }
}

extension ViewController: UITextFieldDelegate {

   func textFieldShouldReturn(textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
   }
}