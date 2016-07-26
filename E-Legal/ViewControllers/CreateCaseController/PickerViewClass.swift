//
//  PickerViewClass.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 26/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class PickerViewClass: UIView {

   var pickerView = UIPickerView()
   var toolBar = UIToolbar()

   override func awakeFromNib() {
      pickerView = UIPickerView(frame: CGRectMake(0, DefineMacros.SCREEN_HEIGHT - 200, DefineMacros.SCREEN_WIDTH, 200))
      pickerView.backgroundColor = .whiteColor()
      pickerView.showsSelectionIndicator = true
      toolBar.barStyle = UIBarStyle.Default
      toolBar.translucent = true
      toolBar.tintColor = UIColor(red: 76 / 255, green: 217 / 255, blue: 100 / 255, alpha: 1)
      toolBar.sizeToFit()
      let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: CreateCaseViewController.self(), action: #selector(CreateCaseViewController.donePicker))
      let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
      toolBar.setItems([spaceButton, doneButton], animated: false)
      toolBar.userInteractionEnabled = true
   }
   /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
}
