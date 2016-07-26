//
//  ProfileViewController.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 21/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

   @IBOutlet weak var tableView: UITableView!
   let isLawyer = false

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      navigationController?.navigationBarHidden = false
      navigationController?.navigationBar.barTintColor = UIColor(red: 7 / 255, green: 134 / 255, blue: 231 / 255, alpha: 1.0)
   }

   @IBAction func showLeftMenu(sender: UIButton) {
      presentLeftMenuViewController()
   }

   func editUserImage(indexPath: NSIndexPath) -> UserInfoTableViewCell {
      let editUserImageCell = tableView.dequeueReusableCellWithIdentifier("EditUserImageCell", forIndexPath: indexPath) as! UserInfoTableViewCell
      editUserImageCell.buttonEditUserImage.addTarget(self, action: #selector(ProfileViewController.editImage(_:)), forControlEvents: UIControlEvents.TouchUpInside)
      return editUserImageCell;
   }

   @IBAction func editImage (sender: UIButton) {

   }

   func createUserInfoTableViewCell(indexPath: NSIndexPath) -> UserInfoTableViewCell {
      let userInfoCell = tableView.dequeueReusableCellWithIdentifier("BasicInfoCell", forIndexPath: indexPath) as! UserInfoTableViewCell
      userInfoCell.labelUserType.text = Constants.profileInfoArray[indexPath.row]
      return userInfoCell
   }

   func createUserDetailTableViewCell(indexPath: NSIndexPath) -> UserInfoTableViewCell {
      let userPrivacyCell = tableView.dequeueReusableCellWithIdentifier("BasicInfoCell", forIndexPath: indexPath) as! UserInfoTableViewCell
      userPrivacyCell.labelUserType.text = Constants.profileDetailArray[indexPath.row]
      return userPrivacyCell
   }

   func createUserPrivacyTableViewCell(indexPath: NSIndexPath) -> PrivacyTableViweCell {
      let userPrivacyCell = tableView.dequeueReusableCellWithIdentifier("UserPrivacyCell", forIndexPath: indexPath) as! PrivacyTableViweCell
      userPrivacyCell.imageViewUser.image = UIImage(named: Constants.profilePrivacyImagesArray[indexPath.row])
      userPrivacyCell.labelPrivacyText.text = Constants.profilePrivacyArray[indexPath.row]
      return userPrivacyCell
   }

   func createDeleteUserAccountTableViewCell(indexPath: NSIndexPath) -> DeleteButtonTableViewCell {
      let deleteUserAccountCell = tableView.dequeueReusableCellWithIdentifier("DeleteUserCell", forIndexPath: indexPath) as! DeleteButtonTableViewCell
      deleteUserAccountCell.buttonDeleteUser.addTarget(self, action: #selector(ProfileViewController.deleteAccount(_:)), forControlEvents: UIControlEvents.TouchUpInside)
      return deleteUserAccountCell
   }

   @IBAction func deleteAccount (sender: UIButton) {

   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
   }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      if isLawyer {
         return 5
      } else {
         return 4
      }
   }

   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if isLawyer {
         switch section {
         case 0:
            return 1
         case 1:
            return Constants.profileInfoArray.count
         case 2:
            return Constants.profileDetailArray.count
         case 3:
            return Constants.profilePrivacyArray.count
         case 4:
            return 1
         default:
            return 0
         }
      } else {
         switch section {
         case 0:
            return 1
         case 1:
            return Constants.profileInfoArray.count
         case 2:
            return Constants.profilePrivacyArray.count
         case 3:
            return 1
         default:
            return 0
         }
      }
   }

   func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      if isLawyer {
         switch indexPath.section {
         case 0:
            return 126
         case 4:
            return 87
         default:
            return 50
         }
      } else {
         switch indexPath.section {
         case 0:
            return 126
         case 3:
            return 87
         default:
            return 50
         }
      }
   }

   func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      if isLawyer {
         if section == 1 || section == 2 || section == 3 {
            return 50
         } else {
            return 0
         }
      } else {
         if section == 1 || section == 2 {
            return 50
         } else {
            return 0
         }
      }
   }

   func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let customView = NSBundle.mainBundle().loadNibNamed("EditProfileHeadeView", owner: self, options: nil).first as? EditProfileHeadeView
      if isLawyer {
         if section == 1 || section == 2 || section == 3 {
            customView?.labelHeaderTitle.text = Constants.lawyerProfileSections[section - 1]
         }
      } else {
         if section == 1 || section == 2 {
            customView?.labelHeaderTitle.text = Constants.userProfileSections[section - 1]
         }
      }
      return customView
   }

   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

      if isLawyer {
         switch indexPath.section {
         case 0:
            return editUserImage(indexPath)
         case 1:
            return createUserInfoTableViewCell(indexPath)
         case 2:
            return createUserDetailTableViewCell(indexPath)
         case 3:
            return createUserPrivacyTableViewCell(indexPath)
         case 4:
            return createDeleteUserAccountTableViewCell(indexPath)
         default:
            return UITableViewCell()
         }
      } else {
         switch indexPath.section {
         case 0:
            return editUserImage(indexPath)
         case 1:
            return createUserInfoTableViewCell(indexPath)
         case 2:
            return createUserPrivacyTableViewCell(indexPath)
         case 3:
            return createDeleteUserAccountTableViewCell(indexPath)
         default:
            return UITableViewCell()
         }
      }
   }
}
