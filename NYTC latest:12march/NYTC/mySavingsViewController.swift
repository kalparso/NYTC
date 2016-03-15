//
//  mySavingsViewController.swift
//  NYTC
//
//  Created by Promatics on 2/22/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class mySavingsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

     let mySavingConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    @IBOutlet weak var mysaving_tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    var  message :NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Savings"
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
        
        //self.getMySavings()
    }
    
    func getMySavings(){
        
    
        print( NSUserDefaults.standardUserDefaults().valueForKey("device_ID"))
        
        let deviceId = NSUserDefaults.standardUserDefaults().valueForKey("device_ID")
        
        
        self.indicator.hidden = false
        
        self.indicator.startAnimating()
        
        var passDict = [String:AnyObject]()
        
        passDict = ["device_id":deviceId!]
        
        mySavingConn.startConnectionWithString("", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
            
            print(receivedData)
            
            self.indicator.stopAnimating()
            
            self.indicator.hidden = true
            
            if self.mySavingConn.responseCode() == 1 {
                
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
    
    override func viewWillAppear(animated: Bool) {
        
        print(tabBarController?.selectedIndex);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
     return 1
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
     let cell :mySavingTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! mySavingTableViewCell
        
        cell.restaurent_name_lbl.text = "jkcdadc"
        
        cell.save_amount_lbl.text =  "jkcadsc"
        
        cell.pay_amount_lbl.text = "cdalsnc"
        
        cell.date_lbl.text = "12/3/2016"

        
        return cell
    
      
    }

}
