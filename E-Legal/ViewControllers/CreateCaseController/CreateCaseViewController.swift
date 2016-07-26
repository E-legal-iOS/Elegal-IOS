//
//  CreateCaseViewController.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 25/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class CreateCaseViewController: UIViewController {

   @IBOutlet weak var buttonMenu: UIButton!
   @IBOutlet weak var tableView: UITableView!
   var createCaseCell: CreateCaseTableViewCell?
   override func viewDidLoad() {
      super.viewDidLoad()
      navigationController?.navigationBar.barTintColor = UIColor(red: 7 / 255, green: 134 / 255, blue: 231 / 255, alpha: 1.0)
      buttonMenu.addTarget(self, action: #selector(SSASideMenu.presentLeftMenuViewController), forControlEvents: UIControlEvents.TouchUpInside)
      if let pickerView = view as? PickerViewClass {
         pickerView.pickerView.delegate = self
      }
      // Do any additional setup after loading the view.
   }

   func donePicker() {
      createCaseCell?.textFieldChooseCategory.resignFirstResponder()
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