//
//  accountSettingViewController.swift
//  NYTC
//
//  Created by Promatics on 2/22/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class accountSettingViewController: UIViewController {
    
    @IBOutlet weak var btn_back_view: UIView!
    
    @IBOutlet weak var editProfile_btn: UIButton!
    
    @IBOutlet weak var changePass_btn: UIButton!
    
    @IBOutlet weak var logOut_btn: UIButton!
    
    @IBOutlet weak var deactivate_acc_btn: UIButton!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let validation = Validation.validationManager() as! Validation
    
    let deactivateConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    let logOutConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    var message = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Account Setting"
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]

       setInterface()
        
    }
    
    func setInterface() {
        
                
        btn_back_view.frame.origin.y = self.view.frame.size.height/2 - btn_back_view.frame.size.height/2
        
        editProfile_btn.layer.borderColor = UIColor .whiteColor().CGColor
        
        editProfile_btn.layer.borderWidth = 2
        
        editProfile_btn.layer.cornerRadius = 5.0
        
        changePass_btn.layer.borderColor = UIColor .whiteColor().CGColor
        
        changePass_btn.layer.borderWidth = 2
        
        changePass_btn.layer.cornerRadius = 5.0
        
        logOut_btn.layer.borderColor = UIColor .whiteColor().CGColor
        
        logOut_btn.layer.borderWidth = 2
        
        logOut_btn.layer.cornerRadius = 5.0
        
        deactivate_acc_btn.layer.borderColor = UIColor .whiteColor().CGColor
        
        deactivate_acc_btn.layer.borderWidth = 2
        
        deactivate_acc_btn.layer.cornerRadius = 5.0
        
        indicator.frame = self.view.frame
        
        indicator.hidden = true
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            
             let ipad_width = CGFloat(560)
            
            editProfile_btn.frame.size.width = ipad_width
            
            editProfile_btn.frame.size.height = 45
            
            editProfile_btn.frame.origin.x = self.view.frame.size.width/2 - editProfile_btn.frame.size.width/2
            
            editProfile_btn.titleLabel?.font = UIFont(name: (editProfile_btn.titleLabel?.font?.fontName)!, size: 19)
            
            changePass_btn.frame.size.width = ipad_width
            
            changePass_btn.frame.size.height = 45
            
            changePass_btn.frame.origin.x = self.view.frame.size.width/2 - changePass_btn.frame.size.width/2
            
            changePass_btn.titleLabel?.font = UIFont(name:  (changePass_btn.titleLabel?.font?.fontName)!, size: 19)
            
            logOut_btn.frame.size.width = ipad_width
            
            logOut_btn.frame.size.height = 45
            
            logOut_btn.frame.origin.x = self.view.frame.size.width/2 - logOut_btn.frame.size.width/2
            
            logOut_btn.titleLabel?.font = UIFont(name: (logOut_btn.titleLabel?.font?.fontName)!, size: 19)
            
            deactivate_acc_btn.frame.size.width = ipad_width
            
            deactivate_acc_btn.frame.size.height = 45
            
            deactivate_acc_btn.frame.origin.x = self.view.frame.size.width/2 - changePass_btn.frame.size.width/2
            
            deactivate_acc_btn.titleLabel?.font = UIFont(name:  (deactivate_acc_btn.titleLabel?.font?.fontName)!, size: 19)
            
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
       
    }
   
    @IBAction func tapEditProfile_btn(sender: AnyObject) {
       
        self.performSegueWithIdentifier("editProfile", sender: self)
  
        
    }
    

    @IBAction func tapChangePass_btn(sender: AnyObject) {
        
      self.performSegueWithIdentifier("changePassword", sender: self)
        
    }
    
    @IBAction func tapLogOut_ntn(sender: AnyObject) {
        
        self.indicator.hidden = false
        
        self.indicator.startAnimating()
        
        var passDict = [String:AnyObject]()
        
       passDict = ["user_id":(NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("id"))!]
        
        deactivateConn.startConnectionWithString("logout", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
            
            print(receivedData)
            
            self.indicator.stopAnimating()
            
            self.indicator.hidden = true

            
            if self.deactivateConn.responseCode() == 1 {
                
                dispatch_async(dispatch_get_main_queue(),{
                    
                    var arr:NSDictionary?
                    
                    arr = receivedData
                    
                    //This mail id not Registered.Please create your account
                    
                    let result_code = arr?.valueForKey("result") as? String
                    
                    self.indicator.stopAnimating()
                    
                    self.indicator.hidden = true
                    
                    if result_code == "0" {
                        
                         NSUserDefaults.standardUserDefaults().setBool(false, forKey: "login")
                        
                        self.performSegueWithIdentifier("login_signUp", sender: self)
                        
                        let alert = UIAlertController(title: "NYTC", message:"Logged out successfully.", preferredStyle: .Alert)
                        let action = UIAlertAction(title: "OK", style: .Default) { _ in
                            
                        }
                        
                        alert.addAction(action)
                        self.presentViewController(alert, animated: true){}
                        
                    }
                    
                })
                
            }
        }
        
    }
    
    @IBAction func tapDeactivate_acc_btn(sender: AnyObject) {
        
        /*   self.indicator.hidden = false
        
            self.indicator.startAnimating()
        
            var passDict = [String:AnyObject]()
        
            passDict = ["user_id":(NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("id"))!]
        
            deactivateConn.startConnectionWithString("forget_password", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
                
                print(receivedData)
                
                if self.deactivateConn.responseCode() == 1 {
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        
                        var arr:NSDictionary?
                        
                        arr = receivedData
                        
                        //This mail id not Registered.Please create your account
                        
                        let result_code = arr?.valueForKey("result") as? String
                        
                        //  self.message = (arr?.valueForKey("message") as? String)!
                        
                        if result_code == "0" {
                            
                            let alert = UIAlertController(title: "NYTC", message:"Invalid email id.", preferredStyle: .Alert)
                            let action = UIAlertAction(title: "OK", style: .Default) { _ in
                                
                                
                            }
                            alert.addAction(action)
                            self.presentViewController(alert, animated: true){}
                            
                        } else {
                            
                            self.navigationController?.popViewControllerAnimated(true)
                            
                            print(arr?.valueForKey("message") as? String)
                            
                            let alert = UIAlertController(title: "NYTC", message:"'Your password has been sent to your email id.", preferredStyle: .Alert)
                            let action = UIAlertAction(title: "OK", style: .Default) { _ in
                                
                            }
                            
                            alert.addAction(action)
                            self.presentViewController(alert, animated: true){}
                            
                            
                            
                        }
                        
                        // var num = arr?.valueForKey("data") as? NSNumber
                        
                        
                        self.indicator.stopAnimating()
                        
                        self.indicator.hidden = true
                    })
                    
                }
            }
       */
    }
}
