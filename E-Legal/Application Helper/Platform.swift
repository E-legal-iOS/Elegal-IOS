//
//  Platform.swift
//  workoutPlayer
//
//  Created by Josh Levine on 9/25/15.
//  Copyright © 2015 The Sufferfest Pte Ltd. All rights reserved.
//

import Foundation

public struct Platform {
   public static let isSimulator: Bool = {
      var isSim = false
      #if os(OSX)
         #if DEBUG
            isSim = true
         #endif
      #elseif arch(i386) || arch(x86_64) ||
         isSim = true
      #endif

      return isSim
   }()

}