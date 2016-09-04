//
//  CaseDetailsViewController.swift
//  E-Legal
//
//  Created by Ahmad Ishfaq on 9/5/16.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

private enum Sections: Int {
   case CaseDetails = 0
   case SubmitBid = 1
}

class CaseDetailsViewController: UIViewController {

   @IBOutlet weak var tableView: UITableView!
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.001))
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

   @IBAction func back(sender: AnyObject) {
      navigationController?.popViewControllerAnimated(true)
   }
}

extension CaseDetailsViewController: UITableViewDelegate, UITableViewDataSource {
   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 2
   }

   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section {
      case Sections.CaseDetails.rawValue:
         return Constants.caseDetail.count
      default:
         return 1
      }
   }

   func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      return UITableViewAutomaticDimension
   }

   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      switch indexPath.section {
      case Sections.CaseDetails.rawValue:
         let detailCell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! CaseDetailTableViewCell
         detailCell.labelDescription.text = Constants.caseDetail[indexPath.row]
         return detailCell
      case Sections.SubmitBid.rawValue:
         let submitCell = tableView.dequeueReusableCellWithIdentifier("submitCell", forIndexPath: indexPath) as! SubmitBidTableViewCell
         return submitCell
      default:
         return UITableViewCell()
      }
   }

}

