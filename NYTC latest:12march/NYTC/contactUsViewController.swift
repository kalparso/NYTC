//
//  contactUsViewController.swift
//  NYTC
//
//  Created by Promatics on 2/22/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class contactUsViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var user_img: UIImageView!
    
    @IBOutlet weak var email_img: UIImageView!
    
    @IBOutlet weak var mobile_img: UIImageView!
    
    @IBOutlet weak var des_img: UIImageView!
    
    @IBOutlet weak var name_txt: UITextField!
    
    @IBOutlet weak var email_txt: UITextField!

    @IBOutlet weak var mobile_txt: UITextField!
    
    @IBOutlet weak var desc_txt: UITextField!
    
    @IBOutlet weak var submit_btn: UIButton!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     self.title = "Contact Us"
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
     setInterface()
        
    }
    
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        textField.text = textField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        return true
        
    }

    func setInterface() {
        
        
if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad)  {
            
            name_txt.frame.size.width = 500
            
            name_txt.frame.size.height = 45
            
            name_txt.frame.origin.x = (self.view.frame.size.width/2 - name_txt.frame.size.width/2) + 30
            
            name_txt.frame.origin.y =  name_txt.frame.origin.y + 15
            
            
            name_txt.font = UIFont(name: "SystemFont", size: 19)
            
            
            email_txt.frame.size.width = 500
            
            email_txt.frame.size.height = 45
            
            email_txt.frame.origin.x = (self.view.frame.size.width/2 - email_txt.frame.size.width/2)+30
            
            email_txt.frame.origin.y =  email_txt.frame.origin.y + 30
            
            email_txt.font = UIFont(name: "SystemFont", size: 19)
            
            mobile_txt.frame.size.width = 500
            
            mobile_txt.frame.size.height = 45
            
            mobile_txt.frame.origin.x = (self.view.frame.size.width/2 - mobile_txt.frame.size.width/2)+30
            
            mobile_txt.frame.origin.y =  mobile_txt.frame.origin.y + 45
            
            mobile_txt.font = UIFont(name: "SystemFont", size: 19)
            
        
            desc_txt.frame.size.width = 500
            
            desc_txt.frame.size.height = 45
            
            desc_txt.frame.origin.x = (self.view.frame.size.width/2 - desc_txt.frame.size.width/2)+30
            
            desc_txt.frame.origin.y =  desc_txt.frame.origin.y + 60
            
            desc_txt.font = UIFont(name: "SystemFont", size: 19)
            
            
            submit_btn.frame.size.width = 560
            
            submit_btn.frame.size.height = 45
            
            submit_btn.frame.origin.x = self.view.frame.size.width/2 - submit_btn.frame.size.width/2
            
            submit_btn.frame.origin.y =  submit_btn.frame.origin.y + 90
            
            
            submit_btn.titleLabel?.font = UIFont(name: "SystemFont", size: 19)
            
            
            user_img.frame.size.width = 45
            
            user_img.frame.size.height = 45
            
            user_img.frame.origin.x = name_txt.frame.origin.x-60
            
            user_img.frame.origin.y = name_txt.frame.origin.y
            
            email_img.frame.size.width = 45
            
            email_img.frame.size.height = 45
            
            email_img.frame.origin.x = email_txt.frame.origin.x-60
            
            email_img.frame.origin.y = email_txt.frame.origin.y
            
            mobile_img.frame.size.width = 45
            
            mobile_img.frame.size.height = 45
            
            mobile_img.frame.origin.x = mobile_txt.frame.origin.x-60
            
            mobile_img.frame.origin.y = mobile_txt.frame.origin.y
            
            
            des_img.frame.size.width = 45
            
            des_img.frame.size.height = 45
            
            des_img.frame.origin.x = desc_txt.frame.origin.x-60
            
            des_img.frame.origin.y = desc_txt.frame.origin.y
            
            
        }
             
      
        let width = CGFloat(1.0)
        
        let name_txt_border = CALayer()
        
        name_txt_border.borderColor = UIColor.whiteColor().CGColor
        
        name_txt_border.borderColor = UIColor.blackColor().CGColor
        
        name_txt_border.frame = CGRect(x: 0, y: name_txt.frame.size.height - width, width:  name_txt.frame.size.width, height: name_txt.frame.size.height)
        
        name_txt_border.borderWidth = width
        
        name_txt.layer.addSublayer(name_txt_border)
        name_txt.layer.masksToBounds = true
        
        name_txt.attributedPlaceholder = NSAttributedString(string:name_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let email_border = CALayer()
        
        email_border.borderColor = UIColor.whiteColor().CGColor
        
         email_border.borderColor = UIColor.blackColor().CGColor
        
        email_border.frame = CGRect(x: 0, y: email_txt.frame.size.height - width, width:  email_txt.frame.size.width, height: email_txt.frame.size.height)
        
        email_border.borderWidth = width
        
        email_txt.layer.addSublayer(email_border)
        email_txt.layer.masksToBounds = true
        
        email_txt.attributedPlaceholder = NSAttributedString(string:email_txt.placeholder!,
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
        
        let desc_txt_border = CALayer()
        
        desc_txt_border.borderColor = UIColor.whiteColor().CGColor
        
        desc_txt_border.borderColor = UIColor.blackColor().CGColor
        
        desc_txt_border.frame = CGRect(x: 0, y: desc_txt.frame.size.height - width, width:  desc_txt.frame.size.width, height: desc_txt.frame.size.height)
        
        desc_txt_border.borderWidth = width
        
        desc_txt.layer.addSublayer(desc_txt_border)
        desc_txt.layer.masksToBounds = true
        
        desc_txt.attributedPlaceholder = NSAttributedString(string:desc_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        submit_btn.layer.cornerRadius = 5.0
        
        self.indicator.hidden = true
        
        indicator.frame = self.view.frame

        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tapSubmit_btn(sender: AnyObject) {
    }
}
