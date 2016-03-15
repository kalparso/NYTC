//
//  editProfileViewController.swift
//  NYTC
//
//  Created by Promatics on 3/1/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class editProfileViewController: UIViewController,UITabBarDelegate,UITabBarControllerDelegate {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Edit Profile"
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
        self.tabBarController?.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        self.tabBarController?.delegate = self
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        textField.text = textField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        return true
        
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        self.navigationController?.popToRootViewControllerAnimated(false)
        
    }
}



