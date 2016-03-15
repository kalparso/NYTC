//
//  invitefriendViewController.swift
//  NYTC
//
//  Created by Promatics on 3/1/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class invitefriendViewController: UIViewController,UITabBarDelegate,UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

    self.title = "Invite Friends"
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
    let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
        
        self.tabBarController?.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        self.navigationController?.popToRootViewControllerAnimated(false)
        
    }

}
