//
//  HomeViewController.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 20/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      navigationController?.navigationBarHidden = false
      view.backgroundColor = UIColor.whiteColor()
      navigationController?.navigationBar.barTintColor = ColorsConstans.navigationBarColor
   }

   @IBAction func showLeftMenu(sender: UIButton) {
      presentLeftMenuViewController()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
   }
}
