//
//  ViewController.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 18/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit
import Parse
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
      validateFields()
   }

   func validateFields() {
      var error = ""
      if textFieldEmail.text == "" {
         error = error.stringByAppendingString("Please enter your Email!\n")
      } else {
//         if ApplicationHelper.isValidEmail(textFieldEmail.text!) == false {
//            error = error.stringByAppendingString("Email is incorrect!\n")
//         }
      }
      if textFieldPassword.text == "" {
         error = error.stringByAppendingString("Please enter your Password!")
      }
      if error == "" {
         signInUser ()
      } else {
         ApplicationHelper.showAlertView(title: "Alert!", message: error, onViewController: self)
      }
   }

   func signInUser () {
      PFUser.logInWithUsernameInBackground(textFieldEmail.text!, password: textFieldPassword.text!, block: {
         (loggedInUser, error) in

         if error == nil {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewControllerWithIdentifier("SSASideMenu") as! SSASideMenu
            let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
            appDelegate?.window?.rootViewController = viewController
         } else {
            var errorMsg = "Unknown Error"
            if let errorDescription = error?.localizedDescription {
               errorMsg = errorDescription
            }
            ApplicationHelper.showAlertView(title: "Login Failed", message: errorMsg, onViewController: self)
         }
      })
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