//
//  memberShip_planViewController.swift
//  NYTC
//
//  Created by Promatics on 3/1/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class memberShip_planViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     self.title = "Membership Plan"
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
