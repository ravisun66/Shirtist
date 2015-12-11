//
//  SettingsTableViewController.swift
//  Shirtist
//
//  Created by Ravi Shankar Jha on 07/12/15.
//  Copyright © 2015 Ravi Shankar Jha. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    
    @IBOutlet weak var mySizebtn: UIButton!
    
    @IBOutlet weak var myCustomizationBtn: UIButton!
    
    @IBOutlet weak var myOrdersBtn: UIButton!
    
    
    @IBOutlet weak var myOffersBtn: UIButton!
    
    
    @IBOutlet weak var loginOutBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    override func viewDidAppear(animated: Bool) {
        
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
        
        if (!isUserLoggedIn)
        {
            mySizebtn.hidden = true
            myOrdersBtn.hidden = true
            myOffersBtn.hidden = true
            myCustomizationBtn.hidden = true
            loginOutBtn.titleLabel?.text = "Login"
        }
        
    }
    
    @IBAction func logoutTapped(sender: UIButton) {
        
        if (sender.titleLabel?.text == "Login")
        {
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("register")
//                self.presentViewController(viewController, animated: true, completion: nil)
//            })
            
           let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("register")
           self.showViewController(vc as! UIViewController, sender: vc)
            
        } else
        {
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
            

            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("featuredProduct")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        }
        
    }
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
