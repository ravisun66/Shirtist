//
//  RegisterViewController.swift
//  Shirtist
//
//  Created by Ravi Shankar Jha on 10/12/15.
//  Copyright © 2015 Ravi Shankar Jha. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userEmailTextField.delegate = self
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerTapped(sender: UIButton) {
        
        
        let userEmail = userEmailTextField.text
        let userName = userNameTextField.text
        let userPassword = passwordTextField.text
        let repeatPassword = repeatPasswordTextField.text
        
        if (userEmail!.isEmpty || userName!.isEmpty || userPassword!.isEmpty || repeatPassword!.isEmpty)
        {
        
            displayMyAlertMessage("All fields are required.")
            return
        }
        
        if (userPassword != repeatPassword)
        {
            displayMyAlertMessage("Password does not match.")
            return
        }
        
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setObject(userName, forKey: "userName")
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword")
        
        
        let myAlert = UIAlertController(title: "Alert", message: "Registration is successfull!", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default){ action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
        
        
    }
    
        
        
        func displayMyAlertMessage(userMessage: String)
        {
            
            let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated: true, completion: nil)
            
            
        }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
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
