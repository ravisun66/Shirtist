//
//  LoginViewController.swift
//  Shirtist
//
//  Created by Ravi Shankar Jha on 10/12/15.
//  Copyright © 2015 Ravi Shankar Jha. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginTapped(sender: UIButton) {
        
        
        let userEmail = userEmailTextField.text
        let userPassword = passwordTextField.text
        
        let userEmailStored = NSUserDefaults.standardUserDefaults().objectForKey("userEmail") as! String
        let userPasswordStored = NSUserDefaults.standardUserDefaults().objectForKey("userPassword") as! String
        
        print (userEmail)
        print (userEmailStored)
        print (userPassword)
        print (userPasswordStored)
        
        
        if ((userEmail! == userEmailStored) && (userPassword! == userPasswordStored))
        {
            
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("featuredProduct")
            self.showViewController(vc as! UIViewController, sender: vc)
            
            
        } else
        {
            
            
            let myAlert = UIAlertController(title: "Alert", message: "Check Email and Password", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated: true, completion: nil)
            
            
            
        }
        
        
        
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
