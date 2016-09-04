//
//  SettingsTableViewCell.swift
//  E-Legal
//
//  Created by Ahmad Ishfaq on 9/4/16.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

   @IBOutlet weak var switchButton: UISwitch!
   @IBOutlet weak var labelSettings: UILabel!
   override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
   }

   override func setSelected(selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
   }

}
