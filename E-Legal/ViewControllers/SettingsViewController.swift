//
//  SettingsViewController.swift
//  E-Legal
//
//  Created by Ahmad Ishfaq on 9/4/16.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

private enum Sections: Int {
   case ProfileSettings = 0
   case Network = 1
   case Support = 2
}
class SettingsViewController: UIViewController {

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      navigationController?.navigationBar.barTintColor = Colors.navigationBarColor
   }

   @IBAction func showLeftMenu(sender: UIButton) {
      presentLeftMenuViewController()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */

}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {

   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 3
   }

   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section {
      case Sections.ProfileSettings.rawValue:
         return Constants.profileSettings.count
      case Sections.Network.rawValue:
         return Constants.networkSettings.count
      case Sections.Support.rawValue:
         return Constants.supportSettings.count
      default:
         return 0
      }
   }

   func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let headerView = NSBundle.mainBundle().loadNibNamed("SectionHeader", owner: nil, options: nil).last as! SectionHeader
      headerView.label.text = Constants.settingsHeader[section]
      return headerView
   }

   func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      return 46
   }

   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      switch indexPath.section {
      case Sections.ProfileSettings.rawValue:
         let settingsCell = tableView.dequeueReusableCellWithIdentifier("settingsCell", forIndexPath: indexPath) as! SettingsTableViewCell
         settingsCell.labelSettings.text = Constants.profileSettings[indexPath.row]
         if indexPath.row == 0 {
            settingsCell.switchButton.hidden = true
         } else {
            settingsCell.switchButton.hidden = false
         }
         return settingsCell
      case Sections.Network.rawValue:
         let settingsCell = tableView.dequeueReusableCellWithIdentifier("settingsCell", forIndexPath: indexPath) as! SettingsTableViewCell
         settingsCell.labelSettings.text = Constants.networkSettings[indexPath.row]
         return settingsCell
      case Sections.Support.rawValue:
         let settingsCell = tableView.dequeueReusableCellWithIdentifier("settingsCell", forIndexPath: indexPath) as! SettingsTableViewCell
         settingsCell.labelSettings.text = Constants.supportSettings[indexPath.row]
         return settingsCell
      default:
         return UITableViewCell()
      }
   }

}
