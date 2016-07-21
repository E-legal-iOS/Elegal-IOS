//
//  DeleteButton.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 21/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class DeleteButton: UIButton {

   override func awakeFromNib() {
      super.awakeFromNib()
      let size = UIScreen.mainScreen().bounds.width / 414 * titleLabel!.font.pointSize
      titleLabel?.font = UIFont (name: titleLabel!.font.fontName, size: size)

   }
   override func setNeedsLayout() {
      super.setNeedsLayout()
      layer.cornerRadius = 10
      layer.masksToBounds = true
   }
}
