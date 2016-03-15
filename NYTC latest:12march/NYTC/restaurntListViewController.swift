//
//  restaurntListViewController.swift
//  NYTC
//
//  Created by Promatics on 3/3/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class restaurntListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var restaurentListTable: UITableView!
    
    var getResultData:NSMutableArray?
    
    var passResult:NSMutableDictionary? = NSMutableDictionary()
    
    var isFromBasicSearch:Bool?
    
    var favArr:NSMutableArray? = NSMutableArray()
    
    var favVal:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.title = "Restaurants"
        
    let backItem = UIBarButtonItem()
        
    backItem.title = ""
        
    navigationItem.backBarButtonItem = backItem
        
       setFav()
        
    }
    
    func setFav() {
        
        for var i = 0; i<getResultData?.count; i++ {
            
        favVal = getResultData?.objectAtIndex(i).valueForKey("RestaurantInformation")?.valueForKey("userLike") as? String
            
           
            if favVal != nil{
                
                favArr?.addObject(favVal)
                
                print(favVal)
                
            } else {
                
               favArr?.addObject("0")
            }
            
            
            
        }
        
        NSUserDefaults.standardUserDefaults().setObject(favArr, forKey: "favArr")
        
         print(favArr)
        
       

        
    }
    
    override func viewWillAppear(animated: Bool) {
    
        if NSUserDefaults.standardUserDefaults().boolForKey("tabFav"){
            
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "tabFav")
            
            getResultData?.replaceObjectAtIndex(0, withObject: NSUserDefaults.standardUserDefaults().objectForKey("favReasult")!)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: TableView Delegate and Datasource
    
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
        
        cell.restauentNameBtn.setTitle(getResultData?.objectAtIndex(indexPath.row).valueForKey("User")?.valueForKey("restaurantname") as? String, forState:UIControlState.Normal)
        
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
    
        getUrl = (getResultData?.objectAtIndex(indexPath.row).valueForKey("Availability1")?.valueForKey("image"))! as! String
        
       image_URL = NSString(format:"%@%@",offerThumbURL,getUrl )
        
         cell.first_img.setImageWithUrl(NSURL(string:image_URL as String)!, placeHolderImage:UIImage(named:"placeholder image"))
        
        getUrl = (getResultData?.objectAtIndex(indexPath.row).valueForKey("Availability2")?.valueForKey("image"))! as! String
        
        image_URL = NSString(format:"%@%@",offerThumbURL,getUrl )
        
        cell.sec_img.setImageWithUrl(NSURL(string:image_URL as String)!, placeHolderImage:UIImage(named:"placeholder image"))
        
        getUrl = (getResultData?.objectAtIndex(indexPath.row).valueForKey("Availability3")?.valueForKey("image"))! as! String
        
        image_URL = NSString(format:"%@%@",offerThumbURL,getUrl )
        
        cell.third_img.setImageWithUrl(NSURL(string:image_URL as String)!, placeHolderImage:UIImage(named:"placeholder image"))
        
        getUrl = (getResultData?.objectAtIndex(indexPath.row).valueForKey("Availability4")?.valueForKey("image"))! as! String
        
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
        
        
       if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            
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
        
        favVal = String(btn.tag)
        
        passResult = getResultData?.objectAtIndex(btn.tag) as? NSMutableDictionary
        
        print(getResultData?.objectAtIndex(btn.tag))
        
        print("PassRestData:")
        
       // print(passResult)
        
        self.performSegueWithIdentifier("restaurentDetails", sender: self)
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    let restDetailsVc = segue.destinationViewController as! RestaurentDetailsViewController
        
        restDetailsVc.getRestData = passResult
        
        restDetailsVc.fabVc = false
               
        restDetailsVc.favIndex = NSInteger(favVal)
        
        //restDetailsVc.getRestData =  getResultData?.objectAtIndex(0)
    }
    
    
    func tapFirstBtn(sender:AnyObject) {
        
        let btn = sender as! UIButton
        
        let msg = (getResultData?.objectAtIndex(btn.tag).valueForKey("Availability1")?.valueForKey("description"))! as! String
        
        let alert = UIAlertController(title: "NYTC", message:msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { _ in
            
        }
        
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true){}
    }
    
    func secondBtn(sender:AnyObject) {
        
        let btn = sender as! UIButton
        
        let msg = (getResultData?.objectAtIndex(btn.tag).valueForKey("Availability2")?.valueForKey("description"))! as! String
        
        let alert = UIAlertController(title: "NYTC", message:msg, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default) { _ in
            
        }
        
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true){}
    }
    
    func thirdBtn(sender:AnyObject) {
        
        let btn = sender as! UIButton
        
        let msg = (getResultData?.objectAtIndex(btn.tag).valueForKey("Availability3")?.valueForKey("description"))! as! String
        
        let alert = UIAlertController(title: "NYTC", message:msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { _ in
            
        }
        
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true){}
    }
    
    func fourthBtn(sender:AnyObject) {
        
        let btn = sender as! UIButton
        
        let msg = (getResultData?.objectAtIndex(btn.tag).valueForKey("Availability3")?.valueForKey("description"))! as! String
        
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
    
    
}
