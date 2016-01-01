//
//  MasterViewController.swift
//  Hackerly
//
//  Created by Gowda I V, Praveen on 12/30/15.
//  Copyright © 2015 Gowda I V, Praveen. All rights reserved.
//

import UIKit
import libHN
import SDWebImage

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    
    var topPosts = [HNPost]()
    
    var menuTransitionManager = MenuTransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.estimatedRowHeight = 126
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        loadPosts()
        
        self.title = "Home"
    }
    
    func loadPosts() {
        HNManager.sharedManager().loadPostsWithFilter(.Top) { (posts, urlAddition) -> Void in
            if let top = posts as! [HNPost]? {
                self.topPosts = top
                self.tableView.reloadData()
            }else {
                print("Error loading posts")
                self.loadPosts()
            }
        }
    }
    
    func loadMorePosts() {
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let object = objects[indexPath.row] as! NSDate
//                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
        if segue.identifier == "showMenu" {
            let menuTableViewController = segue.destinationViewController as! MenuTableViewController
            menuTableViewController.currentItem = self.title!
//            menuTableViewController.transitioningDelegate = self.menuTransitionManager
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topPosts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostTableViewCell", forIndexPath: indexPath) as! PostTableViewCell

        let post = topPosts[indexPath.row]
        cell.title.text = post.Title
        cell.domain.text = post.UrlDomain
        if (post.Username != "") {
             cell.author.text = post.Username
            if cell.authorImage.hidden {
                cell.authorImage.hidden = false
                cell.author.hidden = false
            }
        } else {
            cell.authorImage.hidden = true
            cell.author.hidden = true
        }
        
        if (post.TimeCreatedString != "") {
            cell.time.text = post.TimeCreatedString
            if cell.timeImage.hidden {
                cell.timeImage.hidden = false
                cell.time.hidden = false
            }
        } else {
            cell.timeImage.hidden = true
            cell.time.hidden = true
        }
        cell.score.text = String(post.Points)
        cell.rowId = indexPath.row
        
        cell.scoreCard.tag = indexPath.row
        cell.scoreCard.addTarget(self, action: "upvote:", forControlEvents: .TouchUpInside)
        
        if post.UrlDomain != nil && post.UrlDomain != "" {
            cell.favicon.superview?.hidden = false
            let faviconURL = NSURL(string: "http://www.google.com/s2/favicons?domain=" + post.UrlDomain)
            cell.favicon.sd_setImageWithURL(faviconURL, placeholderImage: UIImage(named: "domain"))
        } else {
            cell.favicon.superview?.hidden = true
        }
        
        return cell
    }
    
    func upvote(sender: ScoreCard) {
        sender.isFavorite = !sender.isFavorite
        self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: sender.tag, inSection: 0))
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.sourceViewController as! MenuTableViewController
        self.title = sourceController.currentItem
    }

}

