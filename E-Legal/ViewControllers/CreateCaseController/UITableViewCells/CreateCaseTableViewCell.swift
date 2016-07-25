//
//  CreateCaseTableViewCell.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 25/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class CreateCaseTableViewCell: UITableViewCell {

   @IBOutlet weak var textFieldTitle: UITextFieldFontClass!
   @IBOutlet weak var textViewBrief: UITextViewFontClass!
   @IBOutlet weak var textViewDescription: UITextViewFontClass!
   @IBOutlet weak var textFieldChooseCategory: UITextFieldFontClass!
   @IBOutlet weak var segmentExperience: UISegmentedControl!
   @IBOutlet weak var buttonSubmit: UIButtonClass!
    
   override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
   }

   override func setSelected(selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
   }

}
