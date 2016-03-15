//
//  trackSavingViewController.swift
//  NYTC
//
//  Created by Promatics on 3/15/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class trackSavingViewController: UIViewController {

    
    @IBOutlet weak var nameRest_lbl: UILabel!
    
    @IBOutlet weak var totalAmount_txt: UITextField!
    
    
    @IBOutlet weak var payAmount_txt: UITextField!
    
    @IBOutlet weak var submit_btn: UIButton!
    
    
    var message:NSString!
    
    var rest_id:NSString?
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let trackSaving:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    let validation = Validation.validationManager() as! Validation
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad)  {
            
            
        }else{
        
        totalAmount_txt.frame.origin.x = self.view.frame.size.width/2-totalAmount_txt.frame.size.width/2
        
         payAmount_txt.frame.origin.x = self.view.frame.size.width/2-payAmount_txt.frame.size.width/2
        
        submit_btn.frame.origin.x = self.view.frame.size.width/2-submit_btn.frame.size.width/2
            
        totalAmount_txt.attributedPlaceholder = NSAttributedString(string:totalAmount_txt.placeholder!,
                attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
            
        payAmount_txt.attributedPlaceholder = NSAttributedString(string:payAmount_txt.placeholder!,
                attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        submit_btn.layer.cornerRadius = 5
        
    
        
        
        let width = CGFloat(1.0)
        
        let totalAmount_border = CALayer()
        
        totalAmount_border.borderColor = UIColor.blackColor().CGColor
        
        totalAmount_border.frame = CGRect(x: 0, y: totalAmount_txt.frame.size.height - width, width: totalAmount_txt.frame.size.width, height: totalAmount_txt.frame.size.height)
        
        totalAmount_border.borderWidth = width
        
       totalAmount_txt.layer.addSublayer(totalAmount_border)
        
        totalAmount_txt.layer.masksToBounds = true
        
        
        let payAmount_border = CALayer()
        
        totalAmount_border.borderColor = UIColor.blackColor().CGColor
        
        payAmount_border.frame = CGRect(x: 0, y: payAmount_txt.frame.size.height - width, width: payAmount_txt.frame.size.width, height: payAmount_txt.frame.size.height)
        
        payAmount_border.borderWidth = width
        
        payAmount_txt.layer.addSublayer(payAmount_border)
        
        payAmount_txt.layer.masksToBounds = true
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func tapSubmit_btn(sender: AnyObject) {
    
        
        if totalAmount_txt.text == ""{
        
          message = ""
        
        }else if payAmount_txt.text == ""{
          
          message = ""
            
        }
        
        if !message.isEqual(""){
            
            
            let alert = UIAlertController(title: "NYTC", message:message as String, preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default) { _ in
                
                
            }
            alert.addAction(action)
            self.presentViewController(alert, animated: true){}
            
        }
        
        print( NSUserDefaults.standardUserDefaults().valueForKey("device_ID"))
        
        let deviceId = NSUserDefaults.standardUserDefaults().valueForKey("device_ID")
        
        
        self.indicator.hidden = false
        
        self.indicator.startAnimating()
        
        var passDict = [String:AnyObject]()
        
        passDict = ["device_id":deviceId!]
        
        trackSaving.startConnectionWithString("", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
            
            print(receivedData)
            
            self.indicator.stopAnimating()
            
            self.indicator.hidden = true
            
            if self.trackSaving.responseCode() == 1 {
                
                dispatch_async(dispatch_get_main_queue(),{
                    
                    var arr:NSDictionary?
                    
                    arr = receivedData
                    
                    var userDict:NSDictionary?
                    
                    
                    let result_code = arr?.valueForKey("response") as? String
                    
                    self.message = (arr?.valueForKey("message") as? String)!
                    
                    if result_code == "1" {
                        
                        userDict = arr?.valueForKey("result")?.valueForKey("User") as! NSDictionary!
                        
                        NSUserDefaults.standardUserDefaults().setObject(userDict, forKey: "userData")
                        
                        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "login")
                        
                        self.performSegueWithIdentifier("login", sender: self)
                        
                    } else{
                        
                        print(arr?.valueForKey("message") as? String)
                        
                        
                        let alert = UIAlertController(title: "NYTC", message:"", preferredStyle: .Alert)
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
