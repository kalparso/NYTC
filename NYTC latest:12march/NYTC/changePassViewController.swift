//
//  changePassViewController.swift
//  NYTC
//
//  Created by Promatics on 3/1/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class changePassViewController: UIViewController,UITextFieldDelegate,UITabBarDelegate,UITabBarControllerDelegate {
        
    @IBOutlet weak var user_img: UIImageView!

    @IBOutlet weak var oldPass_img: UIImageView!
    @IBOutlet weak var newPass_img: UIImageView!
    
    @IBOutlet weak var confirmPass_img: UIImageView!
    @IBOutlet weak var email_txt: UITextField!
    
    @IBOutlet weak var oldPass_txt: UITextField!
    
    @IBOutlet weak var newPass_txt: UITextField!
    
    @IBOutlet weak var confirmPass_txt: UITextField!
    
    @IBOutlet weak var submit_btn: UIButton!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let validation = Validation.validationManager() as! Validation
    
    let changePassConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    var message = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Change Password"
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
        setInterface()
        
        self.tabBarController?.delegate = self

        }
    
    func setInterface() {
        
    
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad)  {
            
             let fontSize = CGFloat(19)
            
            let ipad_width = CGFloat(560)
            
            oldPass_txt.frame.size.width = ipad_width
            
            oldPass_txt.frame.size.height = 45
            
            oldPass_txt.frame.origin.x = (self.view.frame.size.width/2 - oldPass_txt.frame.size.width/2) + 30
            
            oldPass_txt.frame.origin.y =  oldPass_txt.frame.origin.y + 15
            
            oldPass_txt.font = UIFont(name: (oldPass_txt.font?.fontName)!, size: fontSize)
            
            
            newPass_txt.frame.size.width = ipad_width
            
            newPass_txt.frame.size.height = 45
            
            newPass_txt.frame.origin.x = (self.view.frame.size.width/2 - newPass_txt.frame.size.width/2)+30
            
            newPass_txt.frame.origin.y =  newPass_txt.frame.origin.y + 30
            
            newPass_txt.font = UIFont(name: (newPass_txt.font?.fontName)!, size: fontSize)
            
            
            confirmPass_txt.frame.size.width = ipad_width
            
            confirmPass_txt.frame.size.height = 45
            
            confirmPass_txt.frame.origin.x = (self.view.frame.size.width/2 - confirmPass_txt.frame.size.width/2)+30
            
            confirmPass_txt.frame.origin.y =  confirmPass_txt.frame.origin.y + 45
            
            confirmPass_txt.font = UIFont(name: (confirmPass_txt.font?.fontName)!, size: fontSize)
            
            
            submit_btn.frame.size.width = ipad_width
            
            submit_btn.frame.size.height = 45
            
            submit_btn.frame.origin.x = self.view.frame.size.width/2 - submit_btn.frame.size.width/2
            
            submit_btn.frame.origin.y =  submit_btn.frame.origin.y + 75
            
            
            submit_btn.titleLabel?.font = UIFont(name:  (submit_btn.titleLabel?.font?.fontName)!, size: fontSize)
            
            
            oldPass_img.frame.size.width = 45
            
            oldPass_img.frame.size.height = 45
            
            oldPass_img.frame.origin.x = oldPass_txt.frame.origin.x-60
            
            oldPass_img.frame.origin.y = oldPass_txt.frame.origin.y
            
            newPass_img.frame.size.width = 45
            
            newPass_img.frame.size.height = 45
            
            newPass_img.frame.origin.x = newPass_txt.frame.origin.x-60
            
            newPass_img.frame.origin.y = newPass_txt.frame.origin.y
            
            confirmPass_img.frame.size.width = 45
            
            confirmPass_img.frame.size.height = 45
            
            confirmPass_img.frame.origin.x = confirmPass_txt.frame.origin.x-60
            
            confirmPass_img.frame.origin.y = confirmPass_txt.frame.origin.y
            
            
            
        }

        
        let width = CGFloat(1.0)
        
        
        let oldPass_border = CALayer()
        
        //oldPass_border.borderColor = UIColor.whiteColor().CGColor
        
        oldPass_border.borderColor = UIColor.blackColor().CGColor
        
        oldPass_border.frame = CGRect(x: 0, y: oldPass_txt.frame.size.height - width, width:  oldPass_txt.frame.size.width, height: oldPass_txt.frame.size.height)
        
        oldPass_border.borderWidth = width
        
        oldPass_txt.layer.addSublayer(oldPass_border)
        oldPass_txt.layer.masksToBounds = true
        
        oldPass_txt.attributedPlaceholder = NSAttributedString(string:oldPass_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let newPass_border = CALayer()
        
       // newPass_border.borderColor = UIColor.whiteColor().CGColor
        
        newPass_border.borderColor = UIColor.blackColor().CGColor
        
        newPass_border.frame = CGRect(x: 0, y: newPass_txt.frame.size.height - width, width:  newPass_txt.frame.size.width, height: newPass_txt.frame.size.height)
        
        newPass_border.borderWidth = width
        
        newPass_txt.layer.addSublayer(newPass_border)
        newPass_txt.layer.masksToBounds = true
        
        newPass_txt.attributedPlaceholder = NSAttributedString(string:newPass_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let confirmPass_txt_border = CALayer()
        
       // confirmPass_txt_border.borderColor = UIColor.whiteColor().CGColor
       
        confirmPass_txt_border.borderColor = UIColor.blackColor().CGColor
        
        confirmPass_txt_border.frame = CGRect(x: 0, y: confirmPass_txt.frame.size.height - width, width:  confirmPass_txt.frame.size.width, height: confirmPass_txt.frame.size.height)
        
        confirmPass_txt_border.borderWidth = width
        
        confirmPass_txt.layer.addSublayer(confirmPass_txt_border)
        confirmPass_txt.layer.masksToBounds = true
        
        confirmPass_txt.attributedPlaceholder = NSAttributedString(string:confirmPass_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        submit_btn.layer.cornerRadius = 5.0
        
        indicator.frame = self.view.frame
        
        indicator.hidden = true

    
    }
    
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        textField.text = textField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        return true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSubmit_btn(sender: AnyObject) {
        
        message = ""
        
        if !validation.validateBlankField(oldPass_txt.text) {
            
            message = "Please enter correct current password"
            
        }else if !validation.validateBlankField(newPass_txt.text) {
            
            message = "Please enter new password."
            
        } else if !(newPass_txt.text == confirmPass_txt.text) {
            
            message = "Please confirm new password."
            
        }
        
        print("message : ")
        
        print(message)
        
        if message.characters.count > 0 {
            
            let alert = UIAlertController(title: "NYTC", message:message, preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default) { _ in
            }
            alert.addAction(action)
            self.presentViewController(alert, animated: true){}
            
        } else {
            
            // 0=>'Invalid Email Id Provided',1=>'Your password has been sent to your email id.'
            //forget_password
            
            //user_id,email,oldPassword,newpassword
            
            self.indicator.hidden = false
            
            self.indicator.startAnimating()
            
            var passDict = [String:AnyObject]()
            
            passDict = ["user_id":(NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("id"))!,"email":(NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("email"))!,"oldPassword":oldPass_txt.text!,"newpassword":newPass_txt.text!]
            
            changePassConn.startConnectionWithString("change_password", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
                
                print(receivedData)
                
                self.indicator.stopAnimating()
                
                self.indicator.hidden = true

                
                if self.changePassConn.responseCode() == 1 {
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        
                        var arr:NSDictionary?
                        
                        arr = receivedData
                        
                        //This mail id not Registered.Please create your account
                        
                        let result_code = arr?.valueForKey("result") as? String
                        
                         self.message = (arr?.valueForKey("message") as? String)!
                        
                        self.indicator.stopAnimating()
                        
                        self.indicator.hidden = true
                        
                        if result_code == "1" {
                            
                            print(arr?.valueForKey("message") as? String)
                            
                            let alert = UIAlertController(title: "NYTC", message:self.message, preferredStyle: .Alert)
                            let action = UIAlertAction(title: "OK", style: .Default) { _ in
                                
                            self.navigationController?.popViewControllerAnimated(true)
                                
                            }
                            

                            alert.addAction(action)
                            self.presentViewController(alert, animated: true){}
                            
                          
                            
                        } else {
                            
                            
                            print(arr?.valueForKey("message") as? String)
                            
                            let alert = UIAlertController(title: "Oops!", message:self.message, preferredStyle: .Alert)
                            let action = UIAlertAction(title: "OK", style: .Default) { _ in
                                
                            }
                            
                            alert.addAction(action)
                            self.presentViewController(alert, animated: true){}
                           
                        }
                        
                        // var num = arr?.valueForKey("data") as? NSNumber
                                               
                    })
                    
                }
            }
        }
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        self.navigationController?.popToRootViewControllerAnimated(false)
        
    }
    
}
