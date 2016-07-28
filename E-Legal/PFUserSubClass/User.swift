//
//  User.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 26/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import Foundation
import Parse

public class User: PFUser {

   @NSManaged public var phoneNumber: NSNumber?
   @NSManaged public var registrationNumber: NSNumber?
   @NSManaged public var dateOfBirth: NSNumber?
   @NSManaged public var areaOfPractice: String?
   @NSManaged public var isLawyer: NSNumber?

   override public class func initialize() {
      struct Static {
         static var onceToken: dispatch_once_t = 0;
      }
      dispatch_once(&Static.onceToken) {
         self.registerSubclass()
      }
   }
}
