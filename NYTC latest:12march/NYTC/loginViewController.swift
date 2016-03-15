//
//  loginViewController.swift
//  NYTC
//
//  Created by Promatics on 2/22/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class loginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var logo_img: UIImageView!
    
    @IBOutlet weak var user_img: UIImageView!
    
    @IBOutlet weak var email_txt: UITextField!
    
    @IBOutlet weak var password_img: UIImageView!
    
    @IBOutlet weak var password_txt: UITextField!
    
    @IBOutlet weak var authentic_img: UIImageView!
    
    @IBOutlet weak var authentication_txt: UITextField!
    
    @IBOutlet weak var login_btn: UIButton!
    
    @IBOutlet weak var orView: UIView!
    
    @IBOutlet weak var left_line: UIView!
    
    @IBOutlet weak var right_line: UIView!
    
    @IBOutlet weak var or_btn: UIButton!
    
    @IBOutlet weak var forgot_btn: UIButton!
    
    @IBOutlet weak var login_fb_btn: UIButton!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let validation = Validation.validationManager() as! Validation
    
    let loginConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection

    var message = ""

    override func viewDidLoad() {
        
    super.viewDidLoad()
        
    self.title = "Login"
        
    let backItem = UIBarButtonItem()
    backItem.title = ""
    navigationItem.backBarButtonItem = backItem
        
      setInterface()
}
    func setInterface(){
    
        backView.frame.origin.y = (self.view.frame.size.height/2 - backView.frame.size.height/2)+32
        
if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad)  {
            
            let fontSize = CGFloat(19)
            
            backView.frame.origin.y = (self.view.frame.size.height/2 - backView.frame.size.height/2) - 32
                    
            email_txt.frame.size.width = 500
            
            email_txt.frame.size.height = 45
            
            email_txt.frame.origin.x = (self.view.frame.size.width/2 - email_txt.frame.size.width/2)+30
            
            email_txt.frame.origin.y = email_txt.frame.origin.y + 15
            
            email_txt.font = UIFont(name:  (email_txt.font?.fontName)!, size: fontSize)
            
            password_txt.frame.size.width = 500
            
            password_txt.frame.size.height = 45
            
            password_txt.frame.origin.x = (self.view.frame.size.width/2 - password_txt.frame.size.width/2)+30
            
             password_txt.frame.origin.y = password_txt.frame.origin.y + 30
            
            password_txt.font = UIFont(name:  (email_txt.font?.fontName)!, size: fontSize)
            
           // authentication_txt.frame.size.width = 500
            
           // authentication_txt.frame.size.height = 45
            
            //authentication_txt.frame.origin.x = (self.view.frame.size.width/2 - authentication_txt.frame.size.width/2)+30
            
           // authentication_txt.frame.origin.y = authentication_txt.frame.origin.y + 45
            
           // authentication_txt.font = UIFont(name:  (email_txt.font?.fontName)!, size: fontSize)
            
            user_img.frame.size.width = 45
            
            user_img.frame.size.height = 45
            
            user_img.frame.origin.x = email_txt.frame.origin.x-60
            
            user_img.frame.origin.y = email_txt.frame.origin.y
            
            password_img.frame.size.width = 45
            
            password_img.frame.size.height = 45
            
            password_img.frame.origin.x = password_txt.frame.origin.x-60
            
            password_img.frame.origin.y = password_txt.frame.origin.y
            
           // authentic_img.frame.size.width = 45
            
           // authentic_img.frame.size.height = 45
            
           // authentic_img.frame.origin.x = authentication_txt.frame.origin.x-60
            
            //authentic_img.frame.origin.y = authentication_txt.frame.origin.y
            
            forgot_btn.frame.origin.x = authentication_txt.frame.origin.x + authentication_txt.frame.size.width - forgot_btn.frame.size.width
            
            forgot_btn.frame.origin.y = forgot_btn.frame.origin.y+60
            
            forgot_btn.titleLabel?.font = UIFont(name:  (forgot_btn.titleLabel?.font?.fontName)!, size: fontSize)

            
            login_btn.frame.size.width = 560
            
            login_btn.frame.size.height = 45
            
            login_btn.frame.origin.x = (self.view.frame.size.width/2 - login_btn.frame.size.width/2)
            
            login_btn.titleLabel?.font = UIFont(name:  (login_btn.titleLabel?.font?.fontName)!, size: fontSize)
            
            login_btn.frame.origin.y = login_btn.frame.origin.y + 60

            orView.frame.origin.y = orView.frame.origin.y + 75
            
            login_fb_btn.frame.size.width = 560
            
            login_fb_btn.frame.size.height = 45
            
            login_fb_btn.frame.origin.x = (self.view.frame.size.width/2 - login_fb_btn.frame.size.width/2)
            
            login_fb_btn.titleLabel?.font = UIFont(name: ( login_fb_btn.titleLabel?.font?.fontName)!, size: fontSize)
            
            login_fb_btn.frame.origin.y = login_fb_btn.frame.origin.y+90
    
            
        }
        
        orView.frame.origin.x = self.view.frame.size.width/2 - orView.frame.size.width/2
        
  
        let width = CGFloat(1.0)
        
        let email_border = CALayer()
        
        email_border.borderColor = UIColor.blackColor().CGColor
        
        email_border.frame = CGRect(x: 0, y: email_txt.frame.size.height - width, width:  email_txt.frame.size.width, height: email_txt.frame.size.height)
        
        email_border.borderWidth = width
        
        email_txt.layer.addSublayer(email_border)
        
        email_txt.layer.masksToBounds = true
        
        email_txt.attributedPlaceholder = NSAttributedString(string:email_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let pass_border = CALayer()
        
        pass_border.borderColor = UIColor.blackColor().CGColor
        
        pass_border.frame = CGRect(x: 0, y: password_txt.frame.size.height - width, width:  password_txt.frame.size.width, height: password_txt.frame.size.height)
        
        pass_border.borderWidth = width
        
        password_txt.layer.addSublayer(pass_border)
        password_txt.layer.masksToBounds = true
        
        password_txt.attributedPlaceholder = NSAttributedString(string:password_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        
        let auth_border = CALayer()
        
        auth_border.borderColor = UIColor.blackColor().CGColor
        
       // auth_border.frame = CGRect(x: 0, y: authentication_txt.frame.size.height - width, width:  authentication_txt.frame.size.width, height: authentication_txt.frame.size.height)
        
        auth_border.borderWidth = width
        
       // authentication_txt.layer.addSublayer(auth_border)
//authentication_txt.layer.masksToBounds = true
        
       // authentication_txt.attributedPlaceholder = NSAttributedString(string:authentication_txt.placeholder!,
          //  attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        login_btn.layer.cornerRadius = 5.0
        
        login_fb_btn.layer.cornerRadius = 5.0
        
        or_btn.layer.cornerRadius = or_btn.frame.size.width/2
        
        or_btn.layer.borderWidth = 2.0
        
        or_btn.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.indicator.hidden = true
        
        indicator.frame = self.view.frame
        
        backView.frame.size.height = login_fb_btn.frame.origin.y + login_fb_btn.frame.size.height
        
        scrollView.frame.size.height = backView.frame.size.height + backView.frame.origin.y
     
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
       textField.text = textField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        return true
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tapLogin_btn(sender: AnyObject) {
        
        message = ""
        
        if !validation.validateBlankField(email_txt.text!) {
          
            message = "Please enter email address"
            
        } else if !validation.validateEmail(email_txt.text!){
            
             message = "Please enter valid email address"
            
        } else if !validation.validateBlankField(password_txt.text){
            
            message = "Please enter password"
            
        }
    //        else if !validation.validateBlankField(authentication_txt.text){
//            
//            message = "Please enter authentication code"
//            
//        }
        
        print("message : ")
        
        print(message)
        
        if message.characters.count > 0 {
           
            let alert = UIAlertController(title: "NYTC", message:message, preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default) { _ in
                // Put here any code that you would like to execute when
                // the user taps that OK button (may be empty in your case if that's just
                // an informative alert)
            }
            alert.addAction(action)
            self.presentViewController(alert, animated: true){}
            
        } else {
    print( NSUserDefaults.standardUserDefaults().valueForKey("device_ID"))
        
        //email,password,device_id,activation_key
       let deviceId = NSUserDefaults.standardUserDefaults().valueForKey("device_ID")
            
        
        self.indicator.hidden = false
    
        self.indicator.startAnimating()
            
            var passDict = [String:AnyObject]()
        
            passDict = ["email":email_txt.text!,"password":password_txt.text!,"device_id":deviceId!,"activation_key":""]
            
           // passDict = ["email":email_txt.text!,"password":password_txt.text!,"device_id":deviceId!]
                
            loginConn.startConnectionWithString("login", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
                    
                    print(receivedData)
                    
                    self.indicator.stopAnimating()
                    
                    self.indicator.hidden = true
                    
                    if self.loginConn.responseCode() == 1 {
                        
                        dispatch_async(dispatch_get_main_queue(),{
                            
                            var arr:NSDictionary?
                            
                            arr = receivedData
                            
                             var userDict:NSDictionary?
                            
                            
                            //This mail id not Registered.Please create your account
                            
                            let result_code = arr?.valueForKey("response") as? String
                            
                             self.message = (arr?.valueForKey("message") as? String)!
                            
                            if result_code == "1" {
                                
                                userDict = arr?.valueForKey("result")?.valueForKey("User") as! NSDictionary!
                                
                            NSUserDefaults.standardUserDefaults().setObject(userDict, forKey: "userData")
                                
                        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "login")
                                
                            self.performSegueWithIdentifier("login", sender: self)
                                
                            } else {
                            
                            print(arr?.valueForKey("message") as? String)
                                
                                
                                let alert = UIAlertController(title: "NYTC", message:self.message, preferredStyle: .Alert)
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
        
                    
        }
}
  
    
    @IBAction func tapFb_btn(sender: AnyObject) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        
        fbLoginManager .logInWithReadPermissions(["email"], handler: { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                      fbLoginManager.logOut()
                }
            }
        })
        
       // var error:NSError!
        
  
}
    
    func getFBUserData(){
        
        if((FBSDKAccessToken.currentAccessToken()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil){
                    print(result)
                    
                    
                }
            })
        }
        
    }

}
