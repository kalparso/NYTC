//
//  mySavingsViewController.swift
//  NYTC
//
//  Created by Promatics on 2/22/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class mySavingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Savings"
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        print(tabBarController?.selectedIndex);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
