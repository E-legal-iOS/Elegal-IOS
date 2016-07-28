//
//  SignUpTableViewCell.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 19/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class SignUpTableViewCell: UITableViewCell {

   @IBOutlet var constraintTopRegistrationNo: NSLayoutConstraint!
   @IBOutlet var constraintTopAreaOfPractice: NSLayoutConstraint!
   @IBOutlet var constraintTopbuttonCreateAccount: NSLayoutConstraint!
   @IBOutlet weak var viewForRegistrationNo: UIView!
   @IBOutlet weak var viewForAreaOfPractice: UIView!
   @IBOutlet weak var buttonAddPhoto: UIButton!
   @IBOutlet var ImageViewUser: UIImageView!
   @IBOutlet weak var textFieldName: UITextFieldFontClass!
   @IBOutlet weak var textFieldemail: UITextFieldFontClass!
   @IBOutlet weak var textFieldPassword: UITextFieldFontClass!
   @IBOutlet weak var textFieldPhoneNumber: UITextFieldFontClass!
   @IBOutlet weak var textFieldDateOfBirth: UITextFieldFontClass!
   @IBOutlet weak var switchLawyer: UISwitch!
   @IBOutlet weak var textFieldRegistrationNo: UITextFieldFontClass!
   @IBOutlet weak var textFieldAreaOfPractice: UITextFieldFontClass!
   @IBOutlet weak var buttonCreateAccount: UIButtonClass!
   @IBOutlet weak var buttonLinkedIn: UIButtonClass!
   @IBOutlet weak var buttonGoBack: UIButton!

   override func awakeFromNib() {
      ImageViewUser.layer.cornerRadius = ImageViewUser.frame.size.height / 2
      ImageViewUser.layer.masksToBounds = true
      viewForAreaOfPractice.hidden = true
      viewForRegistrationNo.hidden = true
      constraintTopRegistrationNo.constant = 0
      constraintTopAreaOfPractice.constant = 0
      constraintTopbuttonCreateAccount.constant = 0
   }
}
