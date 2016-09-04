//
//  LeftMenuViewController.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 20/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit
import Parse

class LeftMenuViewController: UIViewController {

   @IBOutlet weak var tableView: UITableView!
   let isLawyer = false
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      navigationController?.navigationBarHidden = true
      automaticallyAdjustsScrollViewInsets = false
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

extension LeftMenuViewController: UITableViewDataSource, UITableViewDelegate {

   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 2
   }

   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if section == 0 {
         return 1
      } else {
         if isLawyer {
            return Constants.arrayLawyeroptionsText.count
         } else {
            return Constants.arrayUserOptionsText.count
         }
      }
   }

   func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      if indexPath.section == 0 {
         return 205
      } else {
         return ApplicationHelper.getCellHeight(70, originalWidth: 414).height
      }
   }

   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      if indexPath.section == 0 {
         let userInfoCell = tableView.dequeueReusableCellWithIdentifier("UserInfoCell", forIndexPath: indexPath) as! UserInfoTableViewCell
         userInfoCell.labelUserName.text = "Biatrichi Moreno"
         userInfoCell.labelUserType.text = "lawer".uppercaseString
         return userInfoCell
      } else {
         let optionsCell = tableView.dequeueReusableCellWithIdentifier("OptionsCell", forIndexPath: indexPath) as! LeftMenuOptionsTableViewCell
         if isLawyer {
            optionsCell.labelTextOption.text = Constants.arrayLawyeroptionsText[indexPath.row]
         } else {
            optionsCell.labelTextOption.text = Constants.arrayUserOptionsText[indexPath.row]
         }
         optionsCell.imageViewOption.image = UIImage(named: Constants.optionsImagesArray[indexPath.row])
         return optionsCell
      }
   }

   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      if indexPath.section == 0 {
         sideMenuViewController?.contentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("profile")
         sideMenuViewController?.hideMenuViewController()
      } else {
         switch indexPath.row {
         case 0:
            sideMenuViewController?.contentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CasesViewController")
            sideMenuViewController?.hideMenuViewController()
         case 1:
            sideMenuViewController?.contentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LawnetViewController")
            sideMenuViewController?.hideMenuViewController()
         case 3:
            sideMenuViewController?.contentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CreateCaseViewController")
            sideMenuViewController?.hideMenuViewController()
         case 4:
            sideMenuViewController?.contentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Settings")
            sideMenuViewController?.hideMenuViewController()
         case 5:
            let appDelegate = AppDelegate()
            appDelegate.logout()
         default:
            break
         }
      }
   }
}