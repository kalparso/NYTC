//
//  login_signup_selViewController.swift
//  NYTC
//
//  Created by Promatics on 2/29/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class login_signup_selViewController: UIViewController {

    @IBOutlet weak var btn_back_view: UIView!
    @IBOutlet weak var login_btn: UIButton!
    
@IBOutlet weak var joinUs_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.title = "NYTC"
        
        let backItem = UIBarButtonItem()
        
        backItem.title = ""
        
        navigationItem.backBarButtonItem = backItem
        
    login_btn.layer.borderColor = UIColor .whiteColor().CGColor
        
    login_btn.layer.borderWidth = 2
        
    login_btn.layer.cornerRadius = 5.0
        
    joinUs_btn.layer.borderColor = UIColor .whiteColor().CGColor
        
    joinUs_btn.layer.borderWidth = 2
        
    joinUs_btn.layer.cornerRadius = 5.0
      
       btn_back_view.frame.origin.y = (self.view.frame.size.height/2 - btn_back_view.frame.size.height/2) + 32
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad)  {
            
            let ipad_width = CGFloat(560)
                                   
            login_btn.frame.size.width = ipad_width
            
            login_btn.frame.size.height = 45
            
            login_btn.frame.origin.x = self.view.frame.size.width/2 - login_btn.frame.size.width/2
            
            login_btn.titleLabel?.font = UIFont(name: (login_btn.titleLabel?.font?.fontName)!, size: 21)
            joinUs_btn.frame.size.width = ipad_width
            
            joinUs_btn.frame.size.height = 45
            
            joinUs_btn.frame.origin.x = self.view.frame.size.width/2 - joinUs_btn.frame.size.width/2
            
            joinUs_btn.titleLabel?.font = UIFont(name: (joinUs_btn.titleLabel?.font.fontName)!, size: 21)
          
        }
        
    //print(NSUserDefaults.standardUserDefaults().valueForKey("userData"))
           
           
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        
    }
    

    @IBAction func tapLogin_btn(sender: AnyObject) {
    
        self.performSegueWithIdentifier("login", sender: self)
           
    }
    
    @IBAction func tapJoinUs_btn(sender: AnyObject) {
        
        self.performSegueWithIdentifier("signUp", sender: self)
    
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   

}
