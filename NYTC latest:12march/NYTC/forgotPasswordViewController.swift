//
//  forgotPasswordViewController.swift
//  NYTC
//
//  Created by Promatics on 2/22/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class forgotPasswordViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var email_img: UIImageView!
    
    @IBOutlet weak var email_txt: UITextField!
    
    
    @IBOutlet weak var submit_btn: UIButton!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let validation = Validation.validationManager() as! Validation
    
    let forgotConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection

    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Forgot Password"
        
        setInterface()
    }
    
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        textField.text = textField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        return true
        
    }
    
    func setInterface(){
        
         backView.frame.origin.y = (self.view.frame.size.height/2 - backView.frame.size.height/2) + 32
        
if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad)  {
            
            backView.frame.origin.y = (self.view.frame.size.height/2 - backView.frame.size.height/2) - 32
            
            email_txt.frame.size.width = 500
            
            email_txt.frame.size.height = 45
            
            email_txt.frame.origin.x = (self.view.frame.size.width/2 - email_txt.frame.size.width/2)+30
            
            email_txt.frame.origin.y = email_txt.frame.origin.y + 50
            
            email_txt.font = UIFont(name: (email_txt.font?.fontName)!, size: 19)

            email_img.frame.size.width = 45
            
            email_img.frame.size.height = 45
            
            email_img.frame.origin.x = email_txt.frame.origin.x - 60
            
            email_img.frame.origin.y = email_txt.frame.origin.y
            
            submit_btn.frame.size.width = 560
            
            submit_btn.frame.size.height = 45
            
            submit_btn.frame.origin.x = self.view.frame.size.width/2 - submit_btn.frame.size.width/2
            
            submit_btn.frame.origin.y = submit_btn.frame.origin.y + 100

            
            submit_btn.titleLabel?.font = UIFont(name: (submit_btn.titleLabel?.font?.fontName)!, size: 19)
        }
        
        let email_txt_border = CALayer()
        
        let width = CGFloat(1.0)
        
        email_txt_border.borderColor = UIColor.whiteColor().CGColor
        
        email_txt_border.borderColor = UIColor.blackColor().CGColor

        
        email_txt_border.frame = CGRect(x: 0, y: email_txt.frame.size.height - width, width:  email_txt.frame.size.width, height: email_txt.frame.size.height)
        
        email_txt_border.borderWidth = width
        
        email_txt.layer.addSublayer(email_txt_border)
        
        email_txt.layer.masksToBounds = true
        
        email_txt.attributedPlaceholder = NSAttributedString(string:email_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        submit_btn.layer.cornerRadius = 5.0
        
        indicator.frame = self.view.frame
        
        indicator.hidden = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    

    @IBAction func tapSubmit_btn(sender: AnyObject) {
       
        message = ""
        
        if !validation.validateBlankField(email_txt.text) {
            
            message = "Please enter email"
            
        } else if !validation.validateEmail(email_txt.text){
            
            message = "Please enter valid email"
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
           
        self.indicator.hidden = false
        
        self.indicator.startAnimating()
        
        var passDict = [String:AnyObject]()
        
        passDict = ["email":email_txt.text!]
        
        forgotConn.startConnectionWithString("forget_password", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
            
            print(receivedData)
            
            self.indicator.stopAnimating()
            
            self.indicator.hidden = true

            
            if self.forgotConn.responseCode() == 1 {
                
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
                        
                        
                        
                        print(arr?.valueForKey("message") as? String)
                        
                        let alert = UIAlertController(title: "NYTC", message:"'Your password has been sent to your email id.", preferredStyle: .Alert)
                        let action = UIAlertAction(title: "OK", style: .Default) { _ in
                           
                            self.navigationController?.popViewControllerAnimated(true) 
                            
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
