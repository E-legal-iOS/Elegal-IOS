//
//  HomeViewController.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 20/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   @IBOutlet weak var buttonMenu: UIButton!

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      navigationController?.navigationBarHidden = false
      view.backgroundColor = UIColor.whiteColor()
      buttonMenu.addTarget(self, action: #selector(SSASideMenu.presentLeftMenuViewController), forControlEvents: UIControlEvents.TouchUpInside)
      navigationController?.navigationBar.barTintColor = UIColor(red: 7 / 255, green: 134 / 255, blue: 231 / 255, alpha: 1.0)
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
   }
}
