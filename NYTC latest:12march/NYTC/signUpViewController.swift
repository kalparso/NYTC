//
//  signUpViewController.swift
//  NYTC
//
//  Created by Promatics on 2/22/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class signUpViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var back_view: UIView!
    
    @IBOutlet weak var logo_img: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var f_user_img: UIImageView!
    
    @IBOutlet weak var f_Name_txt: UITextField!
    
    @IBOutlet weak var l_user_img: UIImageView!
    
    @IBOutlet weak var l_Name_txt: UITextField!

    @IBOutlet weak var mobile_img: UIImageView!
    
    @IBOutlet weak var mobile_txt: UITextField!
    
    @IBOutlet weak var email_img: UIImageView!
    
    @IBOutlet weak var email_txt: UITextField!
    
    @IBOutlet weak var password_img: UIImageView!
    
    @IBOutlet weak var password_txt: UITextField!
    
    @IBOutlet weak var conPass_txt: UITextField!
    
    @IBOutlet weak var conPass_img: UIImageView!
    
    @IBOutlet weak var join_btn: UIButton!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let validation = Validation.validationManager() as! Validation
    
    let signUp:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
 var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Join Us"
        
        setInterface()
       
    }
    
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        textField.text = textField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        return true
        
    }
    
    func setInterface(){
        
         back_view.frame.origin.y = (self.view.frame.size.height/2 - back_view.frame.size.height/2)+32
        
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad)  {
            
          back_view.frame.origin.y = (self.view.frame.size.height/2 - back_view.frame.size.height/2) - 32
            
            f_Name_txt.frame.size.width = 500
            
            f_Name_txt.frame.size.height = 45
            
            f_Name_txt.frame.origin.x = (self.view.frame.size.width/2 - f_Name_txt.frame.size.width/2) + 30
            
            f_Name_txt.frame.origin.y =  f_Name_txt.frame.origin.y + 15
            
            
            f_Name_txt.font = UIFont(name: (f_Name_txt.font?.fontName)!, size: 19)
            
            l_Name_txt.frame.size.width = 500
            
            l_Name_txt.frame.size.height = 45
            
            l_Name_txt.frame.origin.x = (self.view.frame.size.width/2 - l_Name_txt.frame.size.width/2) + 30
            
             l_Name_txt.frame.origin.y =  l_Name_txt.frame.origin.y + 30
            
            l_Name_txt.font = UIFont(name: (f_Name_txt.font?.fontName)!, size: 19)
            
            mobile_txt.frame.size.width = 500
            
            mobile_txt.frame.size.height = 45
            
            mobile_txt.frame.origin.x = (self.view.frame.size.width/2 - mobile_txt.frame.size.width/2)+30
            
            mobile_txt.frame.origin.y =  mobile_txt.frame.origin.y + 45
            
            mobile_txt.font = UIFont(name: (f_Name_txt.font?.fontName)!, size: 19)
            

            
            email_txt.frame.size.width = 500
            
            email_txt.frame.size.height = 45
            
            email_txt.frame.origin.x = (self.view.frame.size.width/2 - email_txt.frame.size.width/2)+30
            
             email_txt.frame.origin.y =  email_txt.frame.origin.y + 60
            
            email_txt.font = UIFont(name: (f_Name_txt.font?.fontName)!, size: 19)

            password_txt.frame.size.width = 500
            
            password_txt.frame.size.height = 45
            
            password_txt.frame.origin.x = (self.view.frame.size.width/2 - password_txt.frame.size.width/2)+30
            
            password_txt.frame.origin.y =  password_txt.frame.origin.y + 75
            
            password_txt.font = UIFont(name: (f_Name_txt.font?.fontName)!, size: 19)

            conPass_txt.frame.size.width = 500
            
            conPass_txt.frame.size.height = 45
            
            conPass_txt.frame.origin.x = (self.view.frame.size.width/2 - conPass_txt.frame.size.width/2)+30
            
             conPass_txt.frame.origin.y =  conPass_txt.frame.origin.y + 90
            
            conPass_txt.font = UIFont(name: (f_Name_txt.font?.fontName)!, size: 19)
            
            join_btn.frame.size.width = 560
            
            join_btn.frame.size.height = 45
            
            join_btn.frame.origin.x = self.view.frame.size.width/2 - join_btn.frame.size.width/2
            
            join_btn.frame.origin.y =  join_btn.frame.origin.y + 120
            
            join_btn.titleLabel?.font = UIFont(name: (join_btn.titleLabel?.font?.fontName)!, size: 19)
            
            
           f_user_img.frame.size.width = 45
            
           f_user_img.frame.size.height = 45
            
           f_user_img.frame.origin.x = f_Name_txt.frame.origin.x-60
            
           f_user_img.frame.origin.y = f_Name_txt.frame.origin.y

            l_user_img.frame.size.width = 45
            
            l_user_img.frame.size.height = 45
            
            l_user_img.frame.origin.x = l_Name_txt.frame.origin.x-60
            
            l_user_img.frame.origin.y = l_Name_txt.frame.origin.y
            
            mobile_img.frame.size.width = 45
            
            mobile_img.frame.size.height = 45
            
            mobile_img.frame.origin.x = mobile_txt.frame.origin.x-60
            
            mobile_img.frame.origin.y = mobile_txt.frame.origin.y
            
            email_img.frame.size.width = 45
            
            email_img.frame.size.height = 45
            
            email_img.frame.origin.x = email_txt.frame.origin.x-60
            
            email_img.frame.origin.y = email_txt.frame.origin.y
            
            password_img.frame.size.width = 45
            
            password_img.frame.size.height = 45
            
            password_img.frame.origin.x = password_txt.frame.origin.x-60
            
            password_img.frame.origin.y = password_txt.frame.origin.y
            
            conPass_img.frame.size.width = 45
            
            conPass_img.frame.size.height = 45
            
            conPass_img.frame.origin.x = conPass_txt.frame.origin.x-60
            
            conPass_img.frame.origin.y = conPass_txt.frame.origin.y
            
        }
        
       
        
        let width = CGFloat(1.0)
        
        let f_Name_txt_border = CALayer()
        
        f_Name_txt_border.borderColor = UIColor.whiteColor().CGColor
        
        f_Name_txt_border.borderColor = UIColor.blackColor().CGColor
        

        
        f_Name_txt_border.frame = CGRect(x: 0, y: f_Name_txt.frame.size.height - width, width:  f_Name_txt.frame.size.width, height: f_Name_txt.frame.size.height)
        
        f_Name_txt_border.borderWidth = width
        
        f_Name_txt.layer.addSublayer(f_Name_txt_border)
        f_Name_txt.layer.masksToBounds = true
        
        f_Name_txt.attributedPlaceholder = NSAttributedString(string:f_Name_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let l_Name_txt_border = CALayer()
        
        l_Name_txt_border.borderColor = UIColor.whiteColor().CGColor
        l_Name_txt_border.borderColor = UIColor.blackColor().CGColor

        
        
        l_Name_txt_border.frame = CGRect(x: 0, y: l_Name_txt.frame.size.height - width, width:  l_Name_txt.frame.size.width, height: l_Name_txt.frame.size.height)
        
        l_Name_txt_border.borderWidth = width
        
        l_Name_txt.layer.addSublayer(l_Name_txt_border)
        
        l_Name_txt.layer.masksToBounds = true
        
        l_Name_txt.attributedPlaceholder = NSAttributedString(string:l_Name_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let mobile_txt_border = CALayer()
        
        mobile_txt_border.borderColor = UIColor.whiteColor().CGColor
        
        mobile_txt_border.borderColor = UIColor.blackColor().CGColor
        
        mobile_txt_border.frame = CGRect(x: 0, y: mobile_txt.frame.size.height - width, width:  mobile_txt.frame.size.width, height: mobile_txt.frame.size.height)
        
        mobile_txt_border.borderWidth = width
        
        mobile_txt.layer.addSublayer(mobile_txt_border)
        
        mobile_txt.layer.masksToBounds = true
        
        mobile_txt.attributedPlaceholder = NSAttributedString(string:mobile_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let email_txt_border = CALayer()
        
        email_txt_border.borderColor = UIColor.whiteColor().CGColor
        
         email_txt_border.borderColor = UIColor.blackColor().CGColor
        
        email_txt_border.frame = CGRect(x: 0, y: email_txt.frame.size.height - width, width:  email_txt.frame.size.width, height: email_txt.frame.size.height)
        
        email_txt_border.borderWidth = width
        
        email_txt.layer.addSublayer(email_txt_border)
        email_txt.layer.masksToBounds = true
        
        email_txt.attributedPlaceholder = NSAttributedString(string:email_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let password_txt_border = CALayer()
        
        password_txt_border.borderColor = UIColor.whiteColor().CGColor
        
        password_txt_border.borderColor = UIColor.blackColor().CGColor
        
        password_txt_border.frame = CGRect(x: 0, y: password_txt.frame.size.height - width, width:  password_txt.frame.size.width, height: password_txt.frame.size.height)
        
        password_txt_border.borderWidth = width
        
        password_txt.layer.addSublayer(password_txt_border)
        password_txt.layer.masksToBounds = true
        
        password_txt.attributedPlaceholder = NSAttributedString(string:password_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let conPass_txt_border = CALayer()
        
        conPass_txt_border.borderColor = UIColor.whiteColor().CGColor
        
         conPass_txt_border.borderColor = UIColor.blackColor().CGColor
        
        conPass_txt_border.frame = CGRect(x: 0, y: conPass_txt.frame.size.height - width, width:  conPass_txt.frame.size.width, height: conPass_txt.frame.size.height)
        
        conPass_txt_border.borderWidth = width
        
        conPass_txt.layer.addSublayer(conPass_txt_border)
        conPass_txt.layer.masksToBounds = true
        
        conPass_txt.attributedPlaceholder = NSAttributedString(string:conPass_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        join_btn.layer.cornerRadius = 5.0
        
        indicator.frame = self.view.frame
        
        indicator.hidden = true
        
        back_view.frame.size.height = join_btn.frame.origin.y + join_btn.frame.size.height
        
        scrollView.frame.size.height = back_view.frame.size.height + back_view.frame.origin.y

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

    @IBAction func tapJoin_btn(sender: AnyObject) {
        
        message = ""
        
        if !validation.validateBlankField(f_Name_txt.text!) {
            
            message = "Please enter first name"
            
        }  else if !validation.validateBlankField(l_Name_txt.text){
            
            message = "Please enter last name"
            
        } else if !validation.validateBlankField(mobile_txt.text){
            
            message = "Please enter mobile number"
            
        } else if !(validation.validatePhoneNumber(mobile_txt.text)){
            
            message = "Please enter valid mobile number"
            
        } else if !validation.validateBlankField(email_txt.text!) {
            
            message = "Please enter email address"
            
        } else if !validation.validateEmail(email_txt.text!){
            
            message = "Please enter valid email address"
            
        } else if !validation.validateBlankField(password_txt.text){
            
            message = "Please enter password"
            
        } else if !validation.validateBlankField(conPass_txt.text){
            
            message = "Passwords do not match"
            
        }else if !(password_txt.text == conPass_txt.text){
            
            message = "Passwords do not match"
            
        }
        
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
        
       // firstname,lastname,phone,email,password,confirmpassword,device_id
            
           // 1 => 'success' , 2 => 'data is not save in table properly' , 3 => 'password and confirm password are not matched' , 4 => 'email is already exist' , 5 => 'remove the white spaces in field' , 6 => 'some data missing' , 7 => 'post request is not present'
        
        passDict = ["firstname":f_Name_txt.text!,"lastname":l_Name_txt.text!,"phone":mobile_txt.text!,"email":email_txt.text!,"password":password_txt.text!,"confirmpassword":conPass_txt.text!,"device_id":deviceId!]
            
            print("dictionary: ")
            
            print(passDict)
        
        signUp.startConnectionWithString("signUp", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
            
            print(receivedData)
            
            self.indicator.stopAnimating()
            
            self.indicator.hidden = true
            
            if self.signUp.responseCode() == 1 {
                
                dispatch_async(dispatch_get_main_queue(),{
                    
                    var arr:NSDictionary?
                    
                    arr = receivedData
                    
                    //This mail id not Registered.Please create your account
                    
                    let result_code = arr?.valueForKey("result") as? String
                    
                    //self.message = (arr?.valueForKey("message") as? String)!
                    
                    if result_code == "1" {
                        
                         self.performSegueWithIdentifier("login", sender: self)
                        
                        self.message = "You are registerd successfully. Please check your registerd email to activate account"
                        
                        
                        let alert = UIAlertController(title: "NYTC", message:self.message, preferredStyle: .Alert)
                        let action = UIAlertAction(title: "OK", style: .Default) { _ in
                            
                            
                        }
                        alert.addAction(action)
                        self.presentViewController(alert, animated: true){}
                        
                       
                        
                    } else if result_code == "2"{
                        
                        print(arr?.valueForKey("message") as? String)
                        
                        self.message = "Data is not save in table properly"
                        
                        let alert = UIAlertController(title: "NYTC", message:self.message, preferredStyle: .Alert)
                        let action = UIAlertAction(title: "OK", style: .Default) { _ in
                            
                            
                        }
                        alert.addAction(action)
                        self.presentViewController(alert, animated: true){}
                        
                    } else if result_code == "3"{
                        
                        print(arr?.valueForKey("message") as? String)
                        
                        self.message = "password and confirm password are not matched"
                        
                        let alert = UIAlertController(title: "NYTC", message:self.message, preferredStyle: .Alert)
                        let action = UIAlertAction(title: "OK", style: .Default) { _ in
                            
                            
                        }
                        alert.addAction(action)
                        self.presentViewController(alert, animated: true){}
                        
                    } else if result_code == "4"{
                        
                        print(arr?.valueForKey("message") as? String)
                        
                        self.message = "email is already exist"
                        
                        let alert = UIAlertController(title: "NYTC", message:self.message, preferredStyle: .Alert)
                        let action = UIAlertAction(title: "OK", style: .Default) { _ in
                            
                            
                        }
                        alert.addAction(action)
                        self.presentViewController(alert, animated: true){}
                        
                    } else if result_code == "5"{
                        
                        print(arr?.valueForKey("message") as? String)
                        
                        self.message = "remove the white spaces in field"
                        
                        let alert = UIAlertController(title: "NYTC", message:self.message, preferredStyle: .Alert)
                        let action = UIAlertAction(title: "OK", style: .Default) { _ in
                            
                            
                        }
                        alert.addAction(action)
                        self.presentViewController(alert, animated: true){}
                        
                    } else if result_code == "6"{
                        
                        print(arr?.valueForKey("message") as? String)
                        
                        self.message = "some data missing"
                        
                        let alert = UIAlertController(title: "NYTC", message:self.message, preferredStyle: .Alert)
                        let action = UIAlertAction(title: "OK", style: .Default) { _ in
                            
                            
                        }
                        alert.addAction(action)
                        self.presentViewController(alert, animated: true){}
                        
                    } else if result_code == "7"{
                        
                        print(arr?.valueForKey("message") as? String)
                        
                        self.message = "post request is not present"
                        
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
}
