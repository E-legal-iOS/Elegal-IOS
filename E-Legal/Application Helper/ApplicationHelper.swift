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

   func animateTextFieldUp(up: Bool, view: UIView, distance: CGFloat, duration: Double) {

      let movementDistance = distance
      let movementDuration = duration
      let movement = (up ? -movementDistance: movementDistance)
      UIView.beginAnimations("anim", context: nil)
      UIView.setAnimationBeginsFromCurrentState(true)
      UIView.setAnimationDuration(movementDuration)
      view.frame = CGRectOffset(view.frame, 0, movement)
      UIView.commitAnimations()
   }

}
