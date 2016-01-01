//
//  MenuTableViewController.swift
//  Hackerly
//
//  Created by Gowda I V, Praveen on 1/1/16.
//  Copyright © 2016 Gowda I V, Praveen. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    let items = ["Home", "Ask HN", "New", "Jobs", "Best"]
    
    var currentItem = "Home"
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell") as? MenuTableViewCell!
        
        cell!.titleLabel.text = items[indexPath.row]
        cell!.titleLabel.textColor = (items[indexPath.row] == currentItem) ? UIColor.whiteColor() : UIColor.grayColor()
        
        return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let menuTableViewController = segue.sourceViewController as! MenuTableViewController
        if let selectedIndexPath = menuTableViewController.tableView.indexPathForSelectedRow {
            currentItem = items[selectedIndexPath.row]
        }
    }
}
