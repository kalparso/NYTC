//
//  fabRestaurantViewController.swift
//  NYTC
//
//  Created by Promatics on 3/10/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class fabRestaurantViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITabBarDelegate,UITabBarControllerDelegate {
    
    @IBOutlet weak var restaurentListTable: UITableView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    var getResultData:NSMutableArray?
    
    var passResult:NSMutableDictionary? = NSMutableDictionary()
    
    var isFromBasicSearch:Bool?
    
    let fabConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    

    
    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Favorites Restaurants"
        
        let backItem = UIBarButtonItem()
        
        backItem.title = ""
        
        navigationItem.backBarButtonItem = backItem
        
        indicator.frame = self.view.frame
        
        self.tabBarController?.delegate = self
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
     getFabList()
        
    }
    
    
    func getFabList(){
        
        let deviceId = NSUserDefaults.standardUserDefaults().valueForKey("device_ID")
        
        let user_id =  (NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("id"))!
        
        
        self.indicator.hidden = false
        
        self.indicator.startAnimating()
        
        var passDict = [String:AnyObject]()
        
                
        passDict = ["device_id":deviceId!,"user_id":user_id]
        
        print("DictData: ")
        
        print(passDict)
        
        fabConn.startConnectionWithString("favourite", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
            
            print(receivedData)
            
            
            if self.fabConn.responseCode() == 1 {
                
                self.indicator.stopAnimating()
                
                self.indicator.hidden = true
                
                
                dispatch_async(dispatch_get_main_queue(),{
                    
                    var arr:NSDictionary?
                    
                    arr = receivedData
                    
                    //This mail id not Registered.Please create your account
                    self.getResultData = arr?.valueForKey("result") as? NSMutableArray
                    
                    self.message = (arr?.valueForKey("message") as? String)!
                    
                  if self.getResultData?.count > 0 {
                    
                    self.restaurentListTable.reloadData()
                        
                    } else   {
                        
                    let alert = UIAlertController(title: "NYTC", message: "No Favorites Restaurant Found", preferredStyle: .Alert)
                    
                   let action = UIAlertAction(title: "OK", style: .Default, handler: { (UIAlertAction) -> Void in
                    
                    self.navigationController?.popViewControllerAnimated(true)
                    
                   })
                       
                 alert.addAction(action)
                    
                   self.presentViewController(alert, animated: true, completion: { () -> Void in
                   
                   })
                    
                    }
                    
                    
                })
                
            }
        }
    }
    
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if getResultData?.count > 0{
            
            return (getResultData?.count)!
            
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:RestaurentTableViewCell!
        
        if cell == nil {
            
            cell = tableView.dequeueReusableCellWithIdentifier("restaurentCell_ID", forIndexPath:indexPath) as? RestaurentTableViewCell
        }
        
        var getUrl = getResultData?.objectAtIndex(indexPath.row).valueForKey("RestaurantInformation")?.valueForKey("images") as! NSString
        
        var tempArr = getUrl.componentsSeparatedByString(",")
        
        if tempArr.count > 1 {
            
            getUrl = tempArr[0]
            
        }
        
        print("\(getUrl)")
        
        var image_URL = NSString(format:"%@%@",imageURL,getUrl)
        
        cell.restaurentImage.setImageWithUrl(NSURL(string:image_URL as String)!, placeHolderImage:UIImage(named:"placeholder image"))
        
        cell.cuisineLbl.text = getResultData?.objectAtIndex(indexPath.row).valueForKey("RestaurantInformation")?.valueForKey("cuisine") as? String
        
        cell.addressLbl.text = getResultData?.objectAtIndex(indexPath.row).valueForKey("RestaurantInformation")?.valueForKey("address") as? String
        
        cell.distanceLbl.text = getResultData?.objectAtIndex(indexPath.row).valueForKey("RestaurantInformation")?.valueForKey("distance") as? String
        
        cell.restauentNameBtn.setTitle(getResultData?.objectAtIndex(indexPath.row).valueForKey("RestaurantInformation")?.valueForKey("User")?.valueForKey("restaurantname") as? String, forState:UIControlState.Normal)
        
        cell.restauentNameBtn.addTarget(self, action:"tapOnRestaurentORViewMoreBtn:", forControlEvents:UIControlEvents.TouchUpInside)
        
        cell.viewMoreBtn.addTarget(self, action:"tapOnRestaurentORViewMoreBtn:", forControlEvents:UIControlEvents.TouchUpInside)
        
        cell.viewMoreBtn.tag = indexPath.row
        
        cell.restauentNameBtn.tag = indexPath.row
        
        cell.firstBtn.tag = indexPath.row
        
        cell.secBtn.tag = indexPath.row
        
        cell.thirdBtn.tag = indexPath.row
        
        cell.fourthbtn.tag = indexPath.row
        
        cell.fifthBtn.tag = indexPath.row
        
        cell.firstBtn.addTarget(self, action:"tapFirstBtn:", forControlEvents:UIControlEvents.TouchUpInside);
        
        cell.secBtn.addTarget(self, action:"secondBtn:", forControlEvents:UIControlEvents.TouchUpInside);
        
        cell.thirdBtn.addTarget(self, action:"thirdBtn:", forControlEvents:UIControlEvents.TouchUpInside);
        
        cell.fourthbtn.addTarget(self, action:"fourthBtn:", forControlEvents:UIControlEvents.TouchUpInside);
        
        cell.fifthBtn.addTarget(self, action:"fifthBtn:", forControlEvents:UIControlEvents.TouchUpInside);
        
        getUrl = (getResultData?.objectAtIndex(indexPath.row).valueForKey("RestaurantInformation")?.valueForKey("Availability1")?.valueForKey("image"))! as! String
        
        image_URL = NSString(format:"%@%@",offerThumbURL,getUrl )
        
        cell.first_img.setImageWithUrl(NSURL(string:image_URL as String)!, placeHolderImage:UIImage(named:"placeholder image"))
        
        getUrl = (getResultData?.objectAtIndex(indexPath.row).valueForKey("RestaurantInformation")?.valueForKey("Availability2")?.valueForKey("image"))! as! String
        
        image_URL = NSString(format:"%@%@",offerThumbURL,getUrl )
        
        cell.sec_img.setImageWithUrl(NSURL(string:image_URL as String)!, placeHolderImage:UIImage(named:"placeholder image"))
        
        getUrl = (getResultData?.objectAtIndex(indexPath.row).valueForKey("RestaurantInformation")?.valueForKey("Availability3")?.valueForKey("image"))! as! String
        
        image_URL = NSString(format:"%@%@",offerThumbURL,getUrl )
        
        cell.third_img.setImageWithUrl(NSURL(string:image_URL as String)!, placeHolderImage:UIImage(named:"placeholder image"))
        
        getUrl = (getResultData?.objectAtIndex(indexPath.row).valueForKey("RestaurantInformation")?.valueForKey("Availability4")?.valueForKey("image"))! as! String
        
        image_URL = NSString(format:"%@%@",offerThumbURL,getUrl )
        
        cell.fourth_img.setImageWithUrl(NSURL(string:image_URL as String)!, placeHolderImage:UIImage(named:"placeholder image"))
        
        let memNum = getResultData?.objectAtIndex(indexPath.row).valueForKey("RestaurantInformation")?.valueForKey("member") as! String
        
        cell.fifthBtn.enabled = false
        
        if memNum == "0" {
            
            cell.fifthBtn.enabled = false
            
        }else {
            
            cell.fifthBtn.enabled = true
            
        }
        
        cell.selectionStyle =   UITableViewCellSelectionStyle.None
        
        return cell!;
        
 }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad){
            
            return 430
            
        } else {
            
            return 330
        }
   }
  
    
    //MARK: Button Action
    
    func tapOnRestaurentORViewMoreBtn(sender:AnyObject){
        
        print("tapOnRestaurentORViewMoreBtn")
        
        let btn = sender as! UIButton
        
        // passResult = getResultData?.objectAtIndex(btn.tag) as? NSMutableArray
        
        passResult = getResultData?.objectAtIndex(btn.tag) as? NSMutableDictionary
        
        print(getResultData?.objectAtIndex(btn.tag))
        
        print("PassRestData:")
        
        // print(passResult)
        
        
        self.performSegueWithIdentifier("restaurentDetails", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let restDetailsVc = segue.destinationViewController as! RestaurentDetailsViewController
        
        restDetailsVc.getRestData = passResult
        
        //restDetailsVc.getRestData =  getResultData?.objectAtIndex(0)
        
        
    }
    
    
    func tapFirstBtn(sender:AnyObject) {
        
        let btn = sender as! UIButton
        
        let msg = (getResultData?.objectAtIndex(btn.tag).valueForKey("RestaurantInformation")?.valueForKey("Availability1")?.valueForKey("description"))! as! String
        
        let alert = UIAlertController(title: "NYTC", message:msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { _ in
            
        }
        
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true){}
    }
    
    func secondBtn(sender:AnyObject) {
        
        let btn = sender as! UIButton
        
        let msg = (getResultData?.objectAtIndex(btn.tag).valueForKey("RestaurantInformation")?.valueForKey("Availability2")?.valueForKey("description"))! as! String
        
        let alert = UIAlertController(title: "NYTC", message:msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { _ in
            
        }
        
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true){}    }
    
    func thirdBtn(sender:AnyObject) {
        
        let btn = sender as! UIButton
        
        let msg = (getResultData?.objectAtIndex(btn.tag).valueForKey("RestaurantInformation")?.valueForKey("Availability3")?.valueForKey("description"))! as! String
        
        let alert = UIAlertController(title: "NYTC", message:msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { _ in
            
        }
        
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true){}
    }
    
    func fourthBtn(sender:AnyObject) {
        
        let btn = sender as! UIButton
        
        let msg = (getResultData?.objectAtIndex(btn.tag).valueForKey("RestaurantInformation")?.valueForKey("Availability3")?.valueForKey("description"))! as! String
        
        let alert = UIAlertController(title: "NYTC", message:msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { _ in
            
        }
        
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true){}
    }
    
    func fifthBtn(sender:AnyObject) {
        
        let btn = sender as! UIButton
        
        var msg = getResultData?.objectAtIndex(btn.tag).valueForKey("RestaurantInformation")?.valueForKey("member") as! NSString
        
        msg = NSString(format:"Maximum %@ member are allowed",msg)
        
        
        let alert = UIAlertController(title: "NYTC", message:msg as String, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { _ in
            
        }
        
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true){}
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
    
        self.navigationController?.popToRootViewControllerAnimated(false)
        
    }

}
