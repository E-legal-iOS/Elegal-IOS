//
//  CreateCaseViewController.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 25/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit
import Parse

class CreateCaseViewController: UIViewController {

   @IBOutlet weak var tableView: UITableView!
   var createCaseCell: CreateCaseTableViewCell?

   override func viewDidLoad() {
      super.viewDidLoad()
      navigationController?.navigationBar.barTintColor = Colors.navigationBarColor
      if let pickerView = view as? PickerViewClass {
         pickerView.pickerView.delegate = self
      }
      // Do any additional setup after loading the view.
   }

   @IBAction func showLeftMenu(sender: UIButton) {
      presentLeftMenuViewController()
   }

   func donePicker() {
      createCaseCell?.textFieldChooseCategory.resignFirstResponder()
   }

   func validateFieldsForCreateCase() {
      var error = ""
      if createCaseCell?.textFieldTitle.text == "" {
         error = error.stringByAppendingString("Please enter title!\n")
      }
      if createCaseCell?.textViewBrief.text == "" {
         error = error.stringByAppendingString("Please enter brief!\n")
      }
//      if createCaseCell?.textViewDescription.text == "" {
//         error = error.stringByAppendingString("Please enter description!\n")
//      }
//      if createCaseCell?.textFieldChooseCategory.text == "" {
//         error = error.stringByAppendingString("Please choose category!")
//      }

      if error == "" {
         createCaseParseAPI()
      } else {
         ApplicationHelper.showAlertView("Alert!", message: error, view: self)
      }
   }

   func createCaseParseAPI() {
      let createCase = PFObject(className: "Case")
      createCase["title"] = createCaseCell?.textFieldTitle.text
      createCase["brief"] = createCaseCell?.textViewBrief.text
      createCase.saveInBackground()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

extension CreateCaseViewController: UITableViewDelegate, UITableViewDataSource {

   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 1
   }

   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
   }

   func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      return ApplicationHelper.getCellHeight(984, originalWidth: 414).height
   }

   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      createCaseCell = tableView.dequeueReusableCellWithIdentifier("CreateCaseTableCell", forIndexPath: indexPath) as? CreateCaseTableViewCell
      guard let createCaseCell = createCaseCell else { return UITableViewCell() }
      if let pickerView = view as? PickerViewClass {
         createCaseCell.textFieldChooseCategory.inputView = pickerView.pickerView
         createCaseCell.textFieldChooseCategory.inputAccessoryView = pickerView.toolBar
      }
      createCaseCell.buttonSubmit.addTarget(self, action: #selector(CreateCaseViewController.validateFieldsForCreateCase), forControlEvents: UIControlEvents.TouchUpInside)
      return createCaseCell
   }
}

extension CreateCaseViewController: UIPickerViewDelegate, UIPickerViewDataSource {

   func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
      return 1
   }

   func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return Constants.lawyerCategory.count
   }

   func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return Constants.lawyerCategory[row]
   }

   func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      createCaseCell?.textFieldChooseCategory.text = Constants.lawyerCategory[row]
   }
}

extension CreateCaseViewController: UITextViewDelegate {

   func textViewDidBeginEditing(textView: UITextView) {
      if textView.text == "Brief" || textView.text == "Description" {
         textView.text = ""
         textView.textColor = UIColor.blackColor()
      }
   }

   func textViewDidEndEditing(textView: UITextView) {
      if textView.text == "" {
         if textView.tag == 0 {
            textView.text = "Brief"
         } else {
            textView.text = "Description"
         }
         textView.textColor = UIColor(red: 154 / 255, green: 198 / 255, blue: 231 / 255, alpha: 1.0)
      }
   }
}

extension CreateCaseViewController: UITextFieldDelegate {

   func textFieldDidBeginEditing(textField: UITextField) {
      if textField.tag == 1 {

      }
   }
}