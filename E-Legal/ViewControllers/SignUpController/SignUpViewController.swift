//
//  SignUpViewController.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 19/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit
import Parse
class SignUpViewController: UIViewController {

   @IBOutlet weak var signUpTableView: UITableView!
   let dobPicker = UIDatePicker()
   var signUpCell: SignUpTableViewCell?
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      navigationController?.navigationBarHidden = true
      automaticallyAdjustsScrollViewInsets = false
      dateOfBirthPicker()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   @IBAction func goBack(sender: UIButton) {
      navigationController?.popViewControllerAnimated(true)
   }

   @IBAction func addPhoto(sender: UIButton) {
      let alert: UIAlertController = UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
      let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default) {
         UIAlertAction in
         self.openCamera()
      }
      let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.Default) {
         UIAlertAction in
         self.openGallary()
      }
      let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
         UIAlertAction in
      }

      alert.addAction(cameraAction)
      alert.addAction(gallaryAction)
      alert.addAction(cancelAction)
      presentViewController(alert, animated: true, completion: nil)

   }

   func openCamera() {
      if (UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)) {
         let picker = UIImagePickerController()
         picker.delegate = self
         picker.sourceType = UIImagePickerControllerSourceType.Camera
         presentViewController(picker, animated: true, completion: nil)
      } else {
//            ApplicationHelper.showAlertView("Alert", message: "You don't have camera", view: self)
      }
   }

   func openGallary() {
      let picker = UIImagePickerController()
      picker.delegate = self
      picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
      presentViewController(picker, animated: true, completion: nil)
   }

   @IBAction func signUpLinkedin(sender: UIButton) {

   }

   @IBAction func createAccount (sender: UIButton) {
      let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let viewController = mainStoryboard.instantiateViewControllerWithIdentifier("SSASideMenu") as! SSASideMenu
      let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
      appDelegate?.window?.rootViewController = viewController

   }

   @IBAction func switchLawyerButtonAction(sender: UISwitch) {
      if sender.on == true {
         signUpCell?.viewForRegistrationNo.hidden = false
         signUpCell?.viewForAreaOfPractice.hidden = false
         signUpCell?.constraintTopRegistrationNo.constant = 31
         signUpCell?.constraintTopAreaOfPractice.constant = 23
         signUpCell?.constraintTopbuttonCreateAccount.constant = 75
      } else {
         signUpCell?.viewForRegistrationNo.hidden = true
         signUpCell?.viewForAreaOfPractice.hidden = true
         signUpCell?.constraintTopRegistrationNo.constant = 0
         signUpCell?.constraintTopAreaOfPractice.constant = 0
         signUpCell?.constraintTopbuttonCreateAccount.constant = 0
      }
   }

   func dateOfBirthPicker() {
      dobPicker.datePickerMode = UIDatePickerMode.Date
      dobPicker.maximumDate = NSDate()
      dobPicker.addTarget(self, action: #selector(SignUpViewController.handleDateOfBirthPicker(_:)), forControlEvents: UIControlEvents.ValueChanged)
   }

   func handleDateOfBirthPicker(sender: UIDatePicker) {
      let timeFormatter = NSDateFormatter()
      timeFormatter.dateFormat = "MM-dd-yyyy"
      signUpCell?.textFieldDateOfBirth.text = timeFormatter.stringFromDate(sender.date)
   }

   func signUpNewuser() {
      let newUser = User()
      newUser.username = signUpCell?.textFieldName.text
      newUser.password = signUpCell?.textFieldPassword.text
      newUser.email = signUpCell?.textFieldemail.text

      // Sign up the user asynchronously
      newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
         if ((error) != nil) {
            ApplicationHelper.showAlertView("Error", message: "\(error)", view: self)
         } else {
            ApplicationHelper.showAlertView("Success", message: "Signed Up", view: self)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in

            })
         }
      })
   }

   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

   }
}

extension SignUpViewController: UITableViewDataSource, UITableViewDelegate {

   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 1
   }

   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
   }

   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

      signUpCell = tableView.dequeueReusableCellWithIdentifier("signUpTableViewCell") as? SignUpTableViewCell
      guard let signUpCell = signUpCell else { return UITableViewCell() }
      signUpCell.buttonAddPhoto.addTarget(self, action: #selector(SignUpViewController.addPhoto(_:)), forControlEvents: UIControlEvents.TouchUpInside)
      signUpCell.buttonLinkedIn.addTarget(self, action: #selector(SignUpViewController.signUpLinkedin(_:)), forControlEvents: UIControlEvents.TouchUpInside)
      signUpCell.buttonCreateAccount.addTarget(self, action: #selector(SignUpViewController.createAccount(_:)), forControlEvents: UIControlEvents.TouchUpInside)
      signUpCell.buttonGoBack.addTarget(self, action: #selector(SignUpViewController.goBack(_:)), forControlEvents: UIControlEvents.TouchUpInside)
      signUpCell.switchLawyer.addTarget(self, action: #selector(SignUpViewController.switchLawyerButtonAction(_:)), forControlEvents: UIControlEvents.ValueChanged)
      signUpCell.textFieldDateOfBirth.inputView = dobPicker
      return signUpCell
   }
}

extension SignUpViewController: UITextFieldDelegate {

   func textFieldDidBeginEditing(textField: UITextField) {

   }

   func textFieldDidEndEditing(textField: UITextField) {

   }

   func textFieldShouldReturn(textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
   }
}

extension SignUpViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {

   func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
      if let choosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
         signUpCell?.ImageViewUser.image = choosenImage
         signUpCell?.buttonAddPhoto.setImage(nil, forState: UIControlState.Normal)
         signUpCell?.buttonAddPhoto.setTitle("", forState: UIControlState.Normal)
      }
      dismissViewControllerAnimated(true, completion: nil)
   }
}
