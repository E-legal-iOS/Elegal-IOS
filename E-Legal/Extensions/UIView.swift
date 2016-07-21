//
//  UIView.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 18/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable extension UIView {

   @IBInspectable var borderColor: UIColor? {
      set {
         layer.borderColor = newValue!.CGColor
      } get {
         if let color = layer.borderColor {
            return UIColor(CGColor: color)
         } else {
            return nil
         }
      }
   }

   @IBInspectable var borderWidth: CGFloat {
      set {
         layer.borderWidth = newValue
      }
      get {
         return layer.borderWidth
      }
   }
}
