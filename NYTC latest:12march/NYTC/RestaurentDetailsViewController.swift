//
//  RestaurentDetailsViewController.swift
//  NYTC
//
//  Created by Promatics on 3/5/16.
//  Copyright © 2016 promatics. All rights reserved.

import UIKit

class RestaurentDetailsViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var paging_scroll: UIScrollView!
    
    @IBOutlet weak var page_Control: UIPageControl!
    
    @IBOutlet weak var des_st_lbl: UILabel!
    
    @IBOutlet weak var des_val_lbl: UILabel!
    
    @IBOutlet weak var cuisine_val_lbl: UILabel!
    
    @IBOutlet weak var address_btn_img: UIButton!
       
    @IBOutlet weak var address_lbl: UILabel!
    
    @IBOutlet weak var web_btn_img: UIButton!
    
    @IBOutlet weak var cuisine_st_lbl: UILabel!
    
    @IBOutlet weak var web_val_lbl: UILabel!
    
    @IBOutlet weak var mobile_btn_img: UIButton!
    
    @IBOutlet weak var mobile_val_lbl: UILabel!
    
    @IBOutlet weak var checkIn_btn_view: UIView!
    
    @IBOutlet weak var checkIn_btn: UIButton!
    
    @IBOutlet weak var rate_btn: UIButton!
    
    @IBOutlet weak var trackSaving_btn: UIButton!
    
    @IBOutlet weak var details_back_view: UIView!
    
    @IBOutlet weak var offer_view: UIView!
    
    @IBOutlet weak var offer_avail_lbl: UILabel!
    
    @IBOutlet weak var offer_1_img: UIImageView!
    
    @IBOutlet weak var offer_1_lbl: UILabel!
    
    @IBOutlet weak var offer_2_img: UIImageView!
    
    var image_view:UIImageView?
    
    @IBOutlet weak var offer_2_lbl: UILabel!
    
    @IBOutlet weak var offer_3_img: UIImageView!
    
    @IBOutlet weak var offer_3_lbl: UILabel!
    
    @IBOutlet weak var offer_4_img: UIImageView!
    
    @IBOutlet weak var offer_4_lbl: UILabel!
    
    @IBOutlet weak var offer_5_img: UIImageView!
    
    @IBOutlet weak var offer_5_lbl: UILabel!
    
    @IBOutlet weak var avial_1_img: UIImageView!
    
    @IBOutlet weak var avial_1_lbl: UILabel!
    
    @IBOutlet weak var avail_2_img: UIImageView!
    
    @IBOutlet weak var avail_2_lbl: UILabel!
    
    @IBOutlet weak var addTofav_btn: UIButton!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var pageImages:NSMutableArray?
    
    var pageViews:NSMutableArray?
    
    var getRestData:NSMutableDictionary?
    
    var page_reverse:Bool?
    
    var timer:NSTimer!
    
    var image_URL:NSString?
    
    var getUrl:NSString?
    
    var member:NSString!
    
    var fabVal:NSString!
    
    var fabVc:Bool?
    
    var arr:NSMutableArray?
    
    var favArr:NSMutableArray? = NSMutableArray()
    
    var favIndex:NSInteger?
    
    let validation = Validation.validationManager() as! Validation
    
    let fabConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    let checkInConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
      //self.title =   getRestData?.valueForKey("User")?.valueForKey("restaurantname") as? String
        
        self.title = "Restaurant Details"
        
        let backItem = UIBarButtonItem()
        
        backItem.title = ""
        
        navigationItem.backBarButtonItem = backItem
        
        indicator.frame = self.view.frame
        
        indicator.hidden = true
        
        
         if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            
            paging_scroll.frame.size.height = 250
            
        } else {
            
        paging_scroll.frame.size.height = 150
            
        }
        
        page_Control.frame.origin.y = paging_scroll.frame.size.height + paging_scroll.frame.origin.y - page_Control.frame.size.height
        
        let imageUrl = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("images")
        
        pageImages = NSMutableArray(array: imageUrl!.componentsSeparatedByString(","))
        
        page_Control.numberOfPages = (pageImages?.count)!
        
        print(pageImages)
        
       // page_Control.currentPage =  1
        
        paging_scroll.pagingEnabled = true
        
        print("RestaurantData:")
        
        print(getRestData)
        
        
       let pageCount = Int((pageImages?.count)!)
        
        self.pageViews = NSMutableArray()
        
        for (var i = 0 ; i < pageCount; ++i) {
            
            self.pageViews?.addObject(NSNull())
        
        }
        
        
    page_reverse = false
        
        let pagesScrollViewSize = self.paging_scroll.frame.size;
        
        self.paging_scroll.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(self.pageImages!.count), pagesScrollViewSize.height);
        
        self.loadVisiblePages()
        
        
        // page_Control.addTarget(self, action: Selector("changePage:"), forControlEvents: UIControlEvents.ValueChanged)
        
        //page_Control.currentPage = 2
        
        timer  =  NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "changePage:", userInfo: nil, repeats: true)
        
        setData()
        

        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func viewDidDisappear(animated: Bool) {
     
        timer.invalidate()
        
    }
    

    //MARK: ScrollView Methods
    
    func loadVisiblePages() {
        // First, determine which page is currently visible
        let pageWidth = CGFloat(self.paging_scroll.frame.size.width)
        
        let page = Int(floor((self.paging_scroll.contentOffset.x * 2.0 + pageWidth)/(pageWidth*2.0)))
        
        
//        // Update the page control
//        self.pageControl.currentPage = page;
       
        // Work out which pages you want to load
        let firstPage = page
        
        let lastPage = 5
        
//        // Purge anything before the first page
        for (var i=0; i<firstPage; i++) {
            
           // self.purgePage(i)
        }

       // Load pages in our range
        for (var i=firstPage; i <= lastPage; i++) {
            
            self.loadPage(i)
            
            
        }
        
       // Purge anything after the last page
        
        for (var i=lastPage+1; i<self.pageImages!.count; i++) {
            
           // self.purgePage(i)
           
        }
    
    }
    
    func loadPage(page:Int) {
        
        
        if (page < 0 || page >= self.pageImages!.count) {
            // If it's outside the range of what you have to display, then do nothing
            return;
        }
        
        let pageView = self.pageViews?.objectAtIndex(page)
        
        if (pageView as? NSNull == NSNull()) {
            
            var frame = self.paging_scroll.bounds
            
            frame.origin.x = frame.size.width * CGFloat(page) + 8.0
            
            frame.origin.y = 0.0;
            
            frame.size.width = (frame.size.width - 16.0)
            
            frame.size.height = 122.0
            
           // frame.size.height = paging_scroll.frame.size.height
            
            
            
         //   let newPageView = UIImageView(image:self.pageImages!.objectAtIndex(page) as? UIImage)
            
             getUrl = self.pageImages!.objectAtIndex(page) as? String
            
            image_URL = NSString(format:"%@%@",imageURL,getUrl!)
            
            print(image_URL)
            
            let newPageView = UIImageView()
            
          //  newPageView = UIImageView(image:"placeholder image" as? UIImage)
            
            newPageView.setImageWithUrl(NSURL(string:image_URL as! String)!,placeHolderImage:UIImage(named:"placeholder image"))
            
            if newPageView.image == nil{
                
                print("no image ")
            }
            
            //cell.restaurentImage.setImageWithUrl(NSURL(string:image_URL as String)!, placeHolderImage:UIImage(named:"placeholder image"))
            
            newPageView.contentMode = UIViewContentMode.ScaleAspectFill
            
            newPageView.frame = frame;
            
            self.paging_scroll .addSubview(newPageView)
            
            self.pageViews?.replaceObjectAtIndex(page, withObject:newPageView)
            
             // page_Control.currentPage = page
            
        }
    }
    
    func purgePage (page:Int) {
        
        
        if (page < 0 || page >= self.pageImages!.count) {
            // If it's outside the range of what you have to display, then do nothing
            return;
        }
        
// Remove a page from the scroll view and reset the container array
        
        let pageView = self.pageViews?.objectAtIndex(page)
        
        let null_value = NSNull()
        
        if (pageView as? NSNull  != null_value) {
            
            pageView!.removeFromSuperview;
            
            self.pageViews?.replaceObjectAtIndex(page, withObject:null_value)
        
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    func scrollViewDidScroll(scrollView: UIScrollView) {
    
        
    }
    
    func changePage(sender: AnyObject) -> () {
        
        let pageNo  = page_Control.currentPage
        
        if page_reverse == true {
            
            page_Control.currentPage = page_Control.currentPage-1
            
            if pageNo <= 0 {
                
                page_Control.currentPage = page_Control.currentPage+1
                
                page_reverse = false
                
            }
 
        } else {
         
            page_Control.currentPage = page_Control.currentPage+1
           
            if pageNo >= page_Control.numberOfPages-1 {
                
                page_Control.currentPage = page_Control.currentPage-1
                
                page_reverse = true

            }
        }
        
        
        let x = CGFloat(page_Control.currentPage) * paging_scroll.frame.size.width
        
        paging_scroll.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        
        page_Control.currentPage = Int(pageNumber)
    }

    
    func setData() {
        
        addTofav_btn.layer.cornerRadius = 5
        
        checkIn_btn.layer.cornerRadius = 5
        
        rate_btn.layer.cornerRadius = 5
        
        trackSaving_btn.layer.cornerRadius = 5
        
        rate_btn.titleLabel?.textAlignment = NSTextAlignment.Center
        
        trackSaving_btn.titleLabel?.textAlignment = NSTextAlignment.Center
        
        if fabVc == false {
        
       // fabVal = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("userLike") as? String
            
            //favArr?.addObjectsFromArray(NSUserDefaults.standardUserDefaults().objectForKey("favArr"))
            
            arr = NSUserDefaults.standardUserDefaults().objectForKey("favArr") as? NSMutableArray
            
            
           print(favArr)
            
            for var i = 0; i<arr?.count; i++ {
              
                fabVal = arr?.objectAtIndex(i) as? String
                                
                favArr?.addObject(fabVal)
                
            }
            
          
            
            
        fabVal = favArr?.objectAtIndex(favIndex!) as?String
           
        if fabVal == "0" {
            
            
            addTofav_btn.setImage(UIImage(named: "unlike"), forState: UIControlState.Normal)
            
        }
            des_val_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("description") as? String
            
            des_val_lbl.sizeToFit()
            
            
            cuisine_val_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("cuisine") as? String
            
            //getUrl = getRestData?.valueForKey("Availability4")?.valueForKey("image"))! as! String
            
            address_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("description") as? String
            
            
            web_val_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("website") as? String
            
            mobile_val_lbl.text = getRestData?.valueForKey("User")?.valueForKey("mobile") as? String
            
            
            getUrl = getRestData?.valueForKey("Availability1")?.valueForKey("image") as? String
            
            image_URL = NSString(format:"%@%@",offerThumbURL,getUrl! )
            
            
            offer_1_img.setImageWithUrl(NSURL(string:image_URL as! String)!, placeHolderImage:UIImage(named:"placeholder image"))
            
            offer_1_lbl.text = getRestData?.valueForKey("Availability1")?.valueForKey("description") as? String
            
            getUrl = getRestData?.valueForKey("Availability2")?.valueForKey("image") as? String
            
            image_URL = NSString(format:"%@%@",offerThumbURL,getUrl! )
            
            offer_2_img.setImageWithUrl(NSURL(string:image_URL as! String)!, placeHolderImage:UIImage(named:"placeholder image"))
            
            offer_2_lbl.text = getRestData?.valueForKey("Availability2")?.valueForKey("description") as? String
            
            getUrl = getRestData?.valueForKey("Availability3")?.valueForKey("image") as? String
            
            image_URL = NSString(format:"%@%@",offerThumbURL,getUrl! )
            
            offer_3_img.setImageWithUrl(NSURL(string:image_URL as! String)!, placeHolderImage:UIImage(named:"placeholder image"))
            
            offer_3_lbl.text = getRestData?.valueForKey("Availability3")?.valueForKey("description") as? String
            
            
            getUrl = getRestData?.valueForKey("Availability4")?.valueForKey("image") as? String
            
            image_URL = NSString(format:"%@%@",offerThumbURL,getUrl! )
            
            offer_4_img.setImageWithUrl(NSURL(string:image_URL as! String)!, placeHolderImage:UIImage(named:"placeholder image"))
            
            offer_4_lbl.text = getRestData?.valueForKey("Availability4")?.valueForKey("description") as? String
            
    } else {
            
            des_val_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("description") as? String
            
            des_val_lbl.sizeToFit()
            
            
            cuisine_val_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("cuisine") as? String
            
            //getUrl = getRestData?.valueForKey("Availability4")?.valueForKey("image"))! as! String
            
            address_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("description") as? String
            
            
            web_val_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("website") as? String
            
            mobile_val_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("User")?.valueForKey("mobile") as? String
            
            
            getUrl = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("Availability1")?.valueForKey("image") as? String
            
            image_URL = NSString(format:"%@%@",offerThumbURL,getUrl! )
            
            
            offer_1_img.setImageWithUrl(NSURL(string:image_URL as! String)!, placeHolderImage:UIImage(named:"placeholder image"))
            
            offer_1_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("Availability1")?.valueForKey("description") as? String
            
            getUrl = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("Availability2")?.valueForKey("image") as? String
            
            image_URL = NSString(format:"%@%@",offerThumbURL,getUrl! )
            
            offer_2_img.setImageWithUrl(NSURL(string:image_URL as! String)!, placeHolderImage:UIImage(named:"placeholder image"))
            
            offer_2_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("Availability2")?.valueForKey("description") as? String
            
            
            getUrl = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("Availability3")?.valueForKey("image") as? String
            
            image_URL = NSString(format:"%@%@",offerThumbURL,getUrl! )
            
            offer_3_img.setImageWithUrl(NSURL(string:image_URL as! String)!, placeHolderImage:UIImage(named:"placeholder image"))
            
            offer_3_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("Availability3")?.valueForKey("description") as? String
            
            
            getUrl = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("Availability4")?.valueForKey("image") as? String
            
            image_URL = NSString(format:"%@%@",offerThumbURL,getUrl! )
            
            offer_4_img.setImageWithUrl(NSURL(string:image_URL as! String)!, placeHolderImage:UIImage(named:"placeholder image"))
            
            offer_4_lbl.text = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("Availability4")?.valueForKey("description") as? String
            
  
            
        }
        
        offer_5_lbl.text = "Maximum 0 member are allowed"
        
        member = "Maximum "
        
        member = member.stringByAppendingString((getRestData?.valueForKey("RestaurantInformation")?.valueForKey("member") as? String)!)
        
       member = member.stringByAppendingString(" member are allowed")
        
        
       offer_5_lbl.text = member! as String
        
        
        getUrl = "memberscall.png"
        
        image_URL = NSString(format:"%@%@",offerFrontEndURL,getUrl! )
        
        
        avial_1_img.setImageWithUrl(NSURL(string:image_URL as! String)!, placeHolderImage:UIImage(named:"placeholder image"))
        
         getUrl = "checkbankholidays.png"
        
        image_URL = NSString(format:"%@%@",offerFrontEndURL,getUrl! )
        
        avail_2_img.setImageWithUrl(NSURL(string:image_URL as! String)!, placeHolderImage:UIImage(named:"placeholder image"))
        
        avail_2_lbl.sizeToFit()
        
        if (getRestData?.valueForKey("RestaurantInformation")?.valueForKey("member") as? String)! == "0"{
            
            offer_5_lbl.hidden = true
            
            offer_5_img.hidden = true
            
            avail_2_lbl.frame.origin.y = avial_1_lbl.frame.origin.y
            
            avail_2_img.frame.origin.y = avial_1_img.frame.origin.y
            
            avial_1_lbl.frame.origin.y = offer_5_lbl.frame.origin.y
            
            avial_1_img.frame.origin.y = offer_5_img.frame.origin.y
            
            offer_view.frame.size.height = offer_view.frame.size.height - 40
        }
        
        
        if des_val_lbl.frame.size.height < 30 {
            
            des_val_lbl.frame.size.height = 30
            
            
        } else {
            
            
            cuisine_st_lbl.frame.origin.y = des_val_lbl.frame.origin.y + des_val_lbl.frame.size.height+10
            
            cuisine_val_lbl.frame.origin.y = cuisine_st_lbl.frame.origin.y
            
            address_btn_img.frame.origin.y = cuisine_val_lbl.frame.origin.y + cuisine_val_lbl.frame.size.height+10
            
            address_lbl.frame.origin.y = address_btn_img.frame.origin.y
            
            web_btn_img.frame.origin.y = address_lbl.frame.origin.y + address_lbl.frame.size.height+10
            
            web_val_lbl.frame.origin.y = web_btn_img.frame.origin.y
            
            mobile_val_lbl.frame.origin.y = web_val_lbl.frame.origin.y + web_val_lbl.frame.size.height+10
            
            mobile_btn_img.frame.origin.y = mobile_val_lbl.frame.origin.y
            
            checkIn_btn_view.frame.origin.y = mobile_val_lbl.frame.origin.y + mobile_val_lbl.frame.size.height + 10
            
            offer_view.frame.origin.y = checkIn_btn_view.frame.origin.y + checkIn_btn_view.frame.size.height+10
            
            
        }
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            
            offer_view.frame.size.height = offer_view.frame.size.height + 50
        }
        
      details_back_view.frame.size.height = offer_view.frame.origin.y + offer_view.frame.size.height+10
        
     details_back_view.frame.origin.y = paging_scroll.frame.size.height + paging_scroll.frame.origin.y + 10
       
   
     backView.frame.size.height = details_back_view.frame.origin.y + details_back_view.frame.size.height+10
        
    scrollView.frame.size.height = details_back_view.frame.origin.y + details_back_view.frame.size.height+10
        
        print(scrollView.frame.size.height)

        scrollView.contentSize = CGSizeMake(self.view.frame.width,scrollView.frame.size.height*2 - self.view.frame.height)
        
       
    }

    @IBAction func tapFab_btn(sender: AnyObject) {
        
       let deviceId = NSUserDefaults.standardUserDefaults().valueForKey("device_ID")
        
       let user_id =  (NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("id"))!
        
        let rest_id = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("id")
                    
            self.indicator.hidden = false
            
            self.indicator.startAnimating()
            
            var passDict = [String:AnyObject]()
        
            passDict = ["device_id":deviceId!,"user_id":user_id,"restaurant_id":rest_id!]
            
            print(getRestData)
        
        
            print("DictData: ")
            
            print(passDict)
            
            fabConn.startConnectionWithString("likeRestaurant", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
                
                print(receivedData)
                
                
                if self.fabConn.responseCode() == 1 {
                    
                    self.indicator.stopAnimating()
                    
                    self.indicator.hidden = true

                    
                    dispatch_async(dispatch_get_main_queue(),{
                        
                        var arr:NSDictionary?
                        
                        arr = receivedData
                        
                        //This mail id not Registered.Please create your account
                        
                        if self.fabVc == false {
                            
                        if self.fabVal == "0" {
                            
                        self.addTofav_btn.setImage(UIImage(named: "like"), forState: UIControlState.Normal)
                            
                            self.fabVal = "1"
                            
                        } else {
                            
                            self.addTofav_btn.setImage(UIImage(named: "unlike"), forState: UIControlState.Normal)
                                                          
                            self.fabVal = "0"

                        }
                            
                        self.favArr?.replaceObjectAtIndex(0, withObject:self.fabVal)
    
                            
                        print(self.favArr)
                            
                        NSUserDefaults.standardUserDefaults().setObject(self.favArr, forKey: "favArr")
                         
                           
                        } else {
                            
                         self.navigationController?.popViewControllerAnimated(true)
                            
                        }
                        
                        self.message = (arr?.valueForKey("message") as? String)!
                        
                        let alert = UIAlertController(title: "NYTC", message: self.message, preferredStyle: .Alert)
                        let action = UIAlertAction(title: "OK", style: .Default) { _ in
                        }
                        alert.addAction(action)
                        self.presentViewController(alert, animated: true){}
                    })
                    
                }
            }
        }
   
    
    
@IBAction func tapCheck_btn(sender: AnyObject) {
    
    
        let viewWithText = UIAlertController(title:"Enter number of people", message:"", preferredStyle:.Alert)
        
        viewWithText.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
            textField.keyboardType = UIKeyboardType.NumberPad
            
            textField.placeholder = "Please enter number of people"
        }
        
        viewWithText.addAction(UIAlertAction(title:"Cancel", style:UIAlertActionStyle.Cancel, handler: { (action) -> Void in
            
        }))
        
        viewWithText.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
            let textField = viewWithText.textFields![0] 
            
            if(textField.text != nil){
                
               self.callWebservice(textField.text!)
            }
            
        }))
        
        
        self.presentViewController(viewWithText, animated: true, completion:nil)
    

        
}
    
    
    @IBAction func tapRate_btn(sender: AnyObject) {
        
        self.performSegueWithIdentifier("feedBack", sender: self)
    }
    
    @IBAction func tapTrack_btn(sender: AnyObject) {
      
    self.performSegueWithIdentifier("trackSaving", sender: self)

    }
 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
       
        if segue.identifier == "feedBack"{
        
        let feedBackVc = segue.destinationViewController as! feedBackQuesViewController
        
        feedBackVc.rest_id = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("id") as? String
            
        } else  if segue.identifier == "trackSaving"{
            
            let trackSavingVc = segue.destinationViewController as! trackSavingViewController
            
            trackSavingVc.rest_id = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("id") as? String

            
        }
        
        //feedBackVc.rest_id = getRestData?.valueForKey("")
    }
    

func callWebservice(peoples:String){
    
    let deviceId = NSUserDefaults.standardUserDefaults().valueForKey("device_ID")
    
    let user_id =  (NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("id"))!
    
    let rest_id = getRestData?.valueForKey("RestaurantInformation")?.valueForKey("id")
    
    self.indicator.hidden = false
    
    self.indicator.startAnimating()
    
    var passDict = [String:AnyObject]()
    
    passDict = ["device_id":deviceId!,"user_id":user_id,"restaurant_id":rest_id!,"no_of_people":peoples]
    
    print("DictData: ")
    
    print(passDict)
    
  checkInConn.startConnectionWithString("checkIn", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
        
        print(receivedData)
        
        
        if self.checkInConn.responseCode() == 1 {
            
            self.indicator.stopAnimating()
            
            self.indicator.hidden = true
            
            
            dispatch_async(dispatch_get_main_queue(),{
                
                var arr:NSDictionary?
                
                arr = receivedData
                
                //This mail id not Registered.Please create your account
                
                if self.fabVc == false {
                    
                    if self.fabVal == "0" {
                        
                        self.addTofav_btn.setImage(UIImage(named: "like"), forState: UIControlState.Normal)
                        
                        self.fabVal = "1"
                        
                    } else {
                        
                        
                        self.addTofav_btn.setImage(UIImage(named: "unlike"), forState: UIControlState.Normal)
                        
                        self.fabVal = "0"
                        
                    }
                    
                    // self.fabDic?.setValue(self.fabVal!, forKey: "userLike")
                    
                    //self.getRestData?.setObject(self.fabDic!, forKey: "RestaurantInformation")
                    
                    
                    // NSUserDefaults.standardUserDefaults().setBool(true, forKey:"tabFav")
                    
                    //  NSUserDefaults.standardUserDefaults().setObject(self.getRestData, forKey: "favResult")
                }
                
                self.message = (arr?.valueForKey("message") as? String)!
                
                let alert = UIAlertController(title: "NYTC", message: self.message, preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default) { _ in
                }
                alert.addAction(action)
                self.presentViewController(alert, animated: true){}
            })
            
        }
    }
    
  }
    
}

