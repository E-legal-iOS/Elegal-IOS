//
//  ApplicationHelper.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 18/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import Foundation
import UIKit

class ApplicationHelper: NSObject {

   class func animateTextFieldUp(up: Bool, view: UIView, distance: CGFloat, duration: Double) {

      let movementDistance = distance
      let movementDuration = duration
      let movement = (up ? -movementDistance: movementDistance)
      UIView.beginAnimations("anim", context: nil)
      UIView.setAnimationBeginsFromCurrentState(true)
      UIView.setAnimationDuration(movementDuration)
      view.frame = CGRectOffset(view.frame, 0, movement)
      UIView.commitAnimations()
   }

   class func getCellHeight(originalHeight: Int, originalWidth: Int) -> CGSize {
      let height = (originalHeight * Int(DefineMacros.SCREEN_WIDTH)) / originalWidth
      let size = CGSizeMake(DefineMacros.SCREEN_WIDTH, CGFloat(height))
      return size
   }

   class func showAlertView(title title: String, message: String, onViewController: UIViewController) {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
      let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in

      }
      alertController.addAction(cancelAction)
      let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in

      }
      alertController.addAction(OKAction)
      onViewController.presentViewController(alertController, animated: true) {
      }
   }

   class func isValidEmail(testStr: String) -> Bool {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
      let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
      return emailTest.evaluateWithObject(testStr)
   }
}

