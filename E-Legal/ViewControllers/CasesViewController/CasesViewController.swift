//
//  CasesViewController.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 26/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class CasesViewController: UIViewController {

   @IBOutlet weak var searchBar: UISearchBar!
   @IBOutlet weak var tableView: UITableView!

   override func viewDidLoad() {
      super.viewDidLoad()
      navigationController?.navigationBar.barTintColor = Colors.navigationBarColor
      // Do any additional setup after loading the view.
   }

   @IBAction func showLeftMenu(sender: UIButton) {
      presentLeftMenuViewController()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

extension CasesViewController: UITableViewDelegate, UITableViewDataSource {

   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 1
   }

   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 3
   }

   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let caseCell = tableView.dequeueReusableCellWithIdentifier("CaseTableCell", forIndexPath: indexPath) as! CasesTableViewCell
      return caseCell
   }
}

extension CasesViewController: UISearchBarDelegate {

   func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {

   }
}