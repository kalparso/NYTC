//
//  advanceSearchViewController.swift
//  NYTC
//
//  Created by Promatics on 3/3/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class advanceSearchViewController: UIViewController,UITextFieldDelegate,listingDelegate {

    @IBOutlet weak var restaurentTxtF: UITextField!
    
    @IBOutlet weak var postTxtF: UITextField!
    
    @IBOutlet weak var radiusBtn: UIButton!
    
    @IBOutlet weak var specialOffersBtn: UIButton!
    
    @IBOutlet weak var specialCuisineBtn: UIButton!
    
    @IBOutlet weak var fridayBtn: UIButton!

    @IBOutlet weak var saturdayBtn: UIButton!

    @IBOutlet weak var sundayBtn: UIButton!
    
    @IBOutlet weak var otherBtn: UIButton!
    
    @IBOutlet weak var aviality_lbl: UILabel!
    
    @IBOutlet weak var advanceSearchBtn: UIButton!
    
    @IBOutlet weak var availity_view: UIView!
    
    var unCheck,isfri,isSat,isSun,isOther:Bool?
    
    var friVal,satVal,sunVal:String!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var offerVal,radiusVal,cuisineVal:String!
    
    var selButton: UIButton!
    
    var arr = NSArray(objects: "Any(Miles)","2(Miles)","5(Miles)","10(Miles)","100(Miles)","500(Miles)","1000(Miles)","2000(Miles)","3000(Miles)","4000(Miles)","5000(Miles)")
    
    let validation = Validation.validationManager() as! Validation
    
    let searchConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    var message = ""
    
    var passResult:NSMutableArray? = NSMutableArray()
    
    //MARK: View's Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem()
        
        backItem.title = ""
        
        navigationItem.backBarButtonItem = backItem

        
        self.setUIInterface()
        
        isfri = false;
        isSat = false;
        isSun = false;
        isOther = false;
        unCheck = false;
        friVal = "friday"
        satVal = "saturday"
        sunVal = "sunday"
        
    }
    
    func setUIInterface() {
        
        
       if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad)  {
            
            let ipad_width = CGFloat(560)
            
            restaurentTxtF.frame.size.height = 45
            
            restaurentTxtF.frame.size.width = ipad_width
            
            restaurentTxtF.frame.origin.x = self.view.frame.size.width/2 - restaurentTxtF.frame.size.width/2
        
           restaurentTxtF.frame.origin.y = 200
            
            restaurentTxtF.font = UIFont(name: (restaurentTxtF.font?.fontName)!, size: 19)
            
            postTxtF.frame.size.height = 45
            
            postTxtF.frame.size.width = ipad_width
            
            postTxtF.frame.origin.x = self.view.frame.size.width/2 - postTxtF.frame.size.width/2
            
            postTxtF.frame.origin.y = restaurentTxtF.frame.origin.y + restaurentTxtF.frame.size.height + 20
            
            postTxtF.font = UIFont(name: (restaurentTxtF.font?.fontName)!, size: 19)
            
            radiusBtn.frame.size.height = 45
            
            radiusBtn.frame.size.width = ipad_width
            
            radiusBtn.frame.origin.x = self.view.frame.size.width/2 - radiusBtn.frame.size.width/2
            
            radiusBtn.frame.origin.y = postTxtF.frame.origin.y + postTxtF.frame.size.height + 20
            
            radiusBtn.titleLabel?.font = UIFont(name: (restaurentTxtF.font?.fontName)!, size: 19)
            
            specialOffersBtn.frame.size.height = 45
            
            specialOffersBtn.frame.size.width = ipad_width
            
            specialOffersBtn.frame.origin.x = self.view.frame.size.width/2 - specialOffersBtn.frame.size.width/2
            
            specialOffersBtn.frame.origin.y = radiusBtn.frame.origin.y + radiusBtn.frame.size.height + 20
            
             specialOffersBtn.titleLabel?.font = UIFont(name: (restaurentTxtF.font?.fontName)!, size: 19)
            
            specialCuisineBtn.frame.size.height = 45
            
            specialCuisineBtn.frame.size.width = ipad_width
            
            specialCuisineBtn.frame.origin.x = self.view.frame.size.width/2 - radiusBtn.frame.size.width/2
            
            specialCuisineBtn.frame.origin.y = specialOffersBtn.frame.origin.y + specialOffersBtn.frame.size.height + 20
            
             specialCuisineBtn.titleLabel?.font = UIFont(name: (restaurentTxtF.font?.fontName)!, size: 19)
            
            aviality_lbl.frame.origin.x = specialCuisineBtn.frame.origin.x
            
            aviality_lbl.frame.origin.y = specialCuisineBtn.frame.origin.y + specialCuisineBtn.frame.size.height + 20
        
            aviality_lbl.font = UIFont(name: (aviality_lbl.font?.fontName)!, size: 19)
            
            availity_view.frame.origin.x = specialCuisineBtn.frame.origin.x
            
            availity_view.frame.origin.y = aviality_lbl.frame.origin.y + aviality_lbl.frame.size.height + 20
        
           availity_view.frame.size.height = 80
        
           fridayBtn.frame.size.height = 30
        
          fridayBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 90)
        
          fridayBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0,
            100)
        
        fridayBtn.titleLabel?.font = UIFont(name: (fridayBtn.titleLabel?.font?.fontName)!, size: 19)
            
            
        saturdayBtn.frame.size.height = 30
        
        saturdayBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 90)
        
        saturdayBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 100)
        
        saturdayBtn.titleLabel?.font = UIFont(name: (saturdayBtn.titleLabel?.font?.fontName)!, size: 19)
        
        sundayBtn.frame.size.height = 30
        
        sundayBtn.frame.origin.y = sundayBtn.frame.origin.y + 10

        sundayBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 90)
        
        sundayBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 100)
        
        sundayBtn.titleLabel?.font = UIFont(name: (saturdayBtn.titleLabel?.font?.fontName)!, size: 19)
        
        otherBtn.frame.size.height = 30
        
        otherBtn.frame.origin.y = otherBtn.frame.origin.y + 10
        
        otherBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 90)
        
        otherBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 100)
        
        otherBtn.titleLabel?.font = UIFont(name: (otherBtn.titleLabel?.font?.fontName)!, size: 19)
        
           advanceSearchBtn .frame.size.height = 45
            
            advanceSearchBtn.frame.size.width = ipad_width
            
            advanceSearchBtn.frame.origin.x = self.view.frame.size.width/2 - advanceSearchBtn.frame.size.width/2
            
            advanceSearchBtn.frame.origin.y = availity_view.frame.origin.y + availity_view.frame.size.height + 30
            
            advanceSearchBtn.titleLabel?.font = UIFont(name: (restaurentTxtF.font?.fontName)!, size: 19)
            
            radiusBtn.imageEdgeInsets = UIEdgeInsetsMake(10, (radiusBtn.frame.width - 30), 10, 0)
            
            specialOffersBtn.imageEdgeInsets = UIEdgeInsetsMake(10, (specialOffersBtn.frame.width - 30), 10, 0)
            
            specialCuisineBtn.imageEdgeInsets = UIEdgeInsetsMake(10, (specialCuisineBtn.frame.width - 30), 10, 0)
            
        } else {
            
            
            
            radiusBtn.imageEdgeInsets = UIEdgeInsetsMake(5, (radiusBtn.frame.width - 30), 5, 0)
            
            specialOffersBtn.imageEdgeInsets = UIEdgeInsetsMake(5, (specialOffersBtn.frame.width - 30), 5, 0)
            
            specialCuisineBtn.imageEdgeInsets = UIEdgeInsetsMake(5, (specialCuisineBtn.frame.width - 30), 5, 0)
            
        }
        
        
        
    
        let width = CGFloat(1.0)
        let restaurentTxtBorder = CALayer()
        restaurentTxtBorder.borderColor = UIColor.blackColor().CGColor
        restaurentTxtBorder.frame = CGRect(x: 0, y: restaurentTxtF.frame.size.height - width, width:  restaurentTxtF.frame.size.width, height: restaurentTxtF.frame.size.height)
        restaurentTxtBorder.borderWidth = width
        restaurentTxtF.layer.addSublayer(restaurentTxtBorder)
        restaurentTxtF.layer.masksToBounds = true
        restaurentTxtF.attributedPlaceholder = NSAttributedString(string:restaurentTxtF.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let postCodeLayer = CALayer()
        
        postCodeLayer.borderColor = UIColor.blackColor().CGColor
        
        postCodeLayer.frame = CGRect(x: 0, y: postTxtF.frame.size.height - width, width:  postTxtF.frame.size.width, height: postTxtF.frame.size.height)
        
        postCodeLayer.borderWidth = width
        
        postTxtF.layer.addSublayer(postCodeLayer)
        
        postTxtF.layer.masksToBounds = true
        
        postTxtF.attributedPlaceholder = NSAttributedString(string:postTxtF.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        advanceSearchBtn.layer.cornerRadius = 5.0
        
        radiusBtn.layer.borderWidth = 1.0
        
        radiusBtn.layer.borderColor = UIColor.blackColor().CGColor
        
        specialOffersBtn.layer.borderWidth = 1.0
        
        specialOffersBtn.layer.borderColor = UIColor.blackColor().CGColor
        
        specialCuisineBtn.layer.borderWidth = 1.0
        
        specialCuisineBtn.layer.borderColor = UIColor.blackColor().CGColor
       
        
        indicator.hidden = true
        
        indicator.frame = self.view.frame
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    //MARK: Button Action
    @IBAction func tapRadiusBtn(sender: UIButton) {
        
        selButton = sender
        
      // let story_board = UIStoryboard(name: "Main", bundle:nil)
        
        arr = NSArray(objects: "Any(Miles)","2(Miles)","5(Miles)","10(Miles)","100(Miles)","500(Miles)","1000(Miles)","2000(Miles)","3000(Miles)","4000(Miles)","5000(Miles)")
        
        let listvc = storyboard!.instantiateViewControllerWithIdentifier("listingVC") as! ListingViewController
        
        listvc.delegate = self;
        
        listvc.selectedData = []
        
        listvc.isMultipleSelected = false
        
        listvc.array_data = arr.mutableCopy() as! NSMutableArray
        
        //var nav = UINavigationController(rootViewController:listvc)
        
        self.navigationController?.pushViewController(listvc, animated:true)
        
    }
    
    @IBAction func tapSpecialOffersBtn(sender: UIButton) {
        
        //let story_board = UIStoryboard(name: "Main", bundle:nil)
        
         selButton = sender
        
        arr = NSArray(objects: "Any","By 1 Get one free","50% off","Both")
        
        let listvc = storyboard!.instantiateViewControllerWithIdentifier("listingVC") as! ListingViewController
        
        listvc.delegate = self;
        
        listvc.selectedData = []
        
        listvc.isMultipleSelected = false
        
        listvc.array_data = arr.mutableCopy() as! NSMutableArray
        
        //var nav = UINavigationController(rootViewController:listvc)
        
        self.navigationController?.pushViewController(listvc, animated:true)
        
    }
    @IBAction func tapFridayBtn(sender: UIButton) {
        
        unCheck = true
        
        if isfri == false {
            
            friVal = "1"
            
            isfri = true
            
            fridayBtn .setImage(UIImage(named:"checkBox"), forState: UIControlState.Normal)
            
            isOther = false
            
            otherBtn .setImage(UIImage(named:"boxBackground"), forState: UIControlState.Normal)
            
        }else {
            
            friVal = "friday"
            
            isfri = false
            fridayBtn .setImage(UIImage(named:"boxBackground"), forState: UIControlState.Normal)
        }

    }
    @IBAction func tapSpecialCuisineBtn(sender: UIButton) {
        
       // let story_board = UIStoryboard(name: "Main", bundle:nil)
        
         selButton = sender
        
        arr = NSArray(objects: "Any","African","American","Asian","British","Chinese","European","Grill","Indian","International","Italian","Japanese","Korean","Med/Meze","Mediterranean","Mexican/Spanish","Middle Eastern","Nepalese","Russian","Seafood","South African","South American","Spanish","Thai","Vegetarian")
        
        
        let listvc = storyboard!.instantiateViewControllerWithIdentifier("listingVC") as! ListingViewController
        
        listvc.delegate = self;
        
        listvc.selectedData = []
        
        listvc.isMultipleSelected = false
        
        listvc.array_data = arr.mutableCopy() as! NSMutableArray
        
        //var nav = UINavigationController(rootViewController:listvc)
        
        self.navigationController?.pushViewController(listvc, animated:true)
    }
    
    @IBAction func tapOtherBtn(sender: UIButton) {
        
        unCheck = true
        
        if isOther == false {
            
            isOther = true
            
            otherBtn .setImage(UIImage(named:"checkBox"), forState: UIControlState.Normal)
            
            
            sunVal = "sunday"
            
            isSun = false
            sundayBtn .setImage(UIImage(named:"boxBackground"), forState: UIControlState.Normal)
            
            satVal = "saturday"
            
            isSat = false
            saturdayBtn .setImage(UIImage(named:"boxBackground"), forState: UIControlState.Normal)
            
            friVal = "friday"
            
            isfri = false
            
            fridayBtn .setImage(UIImage(named:"boxBackground"), forState: UIControlState.Normal)
            
        } else {
            
            isOther = false
            
            otherBtn .setImage(UIImage(named:"boxBackground"), forState: UIControlState.Normal)
        }
    }
    
    @IBAction func tapSaturdayBtn(sender: UIButton) {
        
        unCheck = true
        
        if isSat == false {
            
            satVal = "1"
            isSat = true
            saturdayBtn .setImage(UIImage(named:"checkBox"), forState: UIControlState.Normal)
            
            isOther = false
            
            otherBtn .setImage(UIImage(named:"boxBackground"), forState: UIControlState.Normal)
            
        }else {
            
            satVal = "saturday"
            
            isSat = false
            saturdayBtn .setImage(UIImage(named:"boxBackground"), forState: UIControlState.Normal)
            
            
        }
    }
    
    @IBAction func tapSundayBtn(sender: UIButton) {
        
        unCheck = true
        
        if isSun == false {
            
            sunVal = "1"
            
            isSun = true
            sundayBtn .setImage(UIImage(named:"checkBox"), forState: UIControlState.Normal)
            
            isOther = false
            
            otherBtn .setImage(UIImage(named:"boxBackground"), forState: UIControlState.Normal)
            
        }else {
            
            sunVal = "sunday"
            
            isSun = false
            
            sundayBtn .setImage(UIImage(named:"boxBackground"), forState: UIControlState.Normal)
            
           
        }
    }

    
    @IBAction func tapAdvanceSearch(sender: AnyObject) {
        
        message = ""
        
        if !validation.validateBlankField(postTxtF.text) {
            
            message = "Please enter post code"
            
        }else if radiusBtn.titleLabel?.text == "Select Radius"{
            
            message = "Please select radius"
            
        } else if specialCuisineBtn.titleLabel?.text == "Special Cuisine"{
            
            message = "Please select Spacial Cuisine"

            
        } else if specialOffersBtn.titleLabel?.text == "Special Offers" {
          
            message = "Please select Spacial Offers"

            
        } else if unCheck == false {
            
            message = "Please select Avialability"
  
        }
        
        print("message : ")
        
        print(message)
        
        if message.characters.count > 0 {
            
            let alert = UIAlertController(title: "NYTC", message:message, preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default) { _ in
            }
            alert.addAction(action)
            self.presentViewController(alert, animated: true){}
            
        } else {
            
            // 0=>'Invalid Email Id Provided',1=>'Your password has been sent to your email id.'
            //forget_password
            
            let deviceId = NSUserDefaults.standardUserDefaults().valueForKey("device_ID")
            
            self.indicator.hidden = false
            
            self.indicator.startAnimating()
            
            var passDict = [String:AnyObject]()
            
           // "user_id":(NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("id"))!,"device_id":deviceId!
            
            //restaurantName,cuisine,postalCode,distance,offer,friday=>1,saturday=>1,sunday=>1,user_id,device_id
            
           if isOther == true {
                
                passDict = ["restaurantName":restaurentTxtF.text!,
                    "postalCode":postTxtF.text!,
                    "distance":radiusVal!,
                    "cuisine":cuisineVal!,
                    "offer":offerVal!,
                    "friday":"1",
                    "saturday":"1",
                    "sunday":"1","user_id":(NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("id"))!,"device_id":deviceId!
            ]
           } else {
            
             passDict = ["restaurantName":restaurentTxtF.text!,
                "postalCode":postTxtF.text!,
                "distance":radiusVal!,
                "cuisine":cuisineVal!,
                "offer":offerVal!,
                "friday":friVal!,
                "saturday":satVal!,
                "sunday":sunVal!,"user_id":(NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("id"))!,"device_id":deviceId!]
            
            }

            
            print("DictData: ")
            
            print(passDict)
            
            searchConn.startConnectionWithString("advanceSearch", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
                
                print(receivedData)
                
                if self.searchConn.responseCode() == 1 {
                    
                    self.indicator.stopAnimating()
                    
                    self.indicator.hidden = true
                    
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        
                        var arr:NSDictionary?
                        
                        arr = receivedData
                        
                        self.radiusBtn.setTitle("Select Radius", forState: UIControlState.Normal)
                        
                        self.radiusVal = "0"
                        
                        self.postTxtF.text = ""
                        
                        self.restaurentTxtF.text = ""
                        
                        self.passResult = arr?.valueForKey("result") as? NSMutableArray
                        
                        print(self.passResult?.count);
                        
                        //This mail id not Registered.Please create your account
                        
                        // let result_code = arr?.valueForKey("result") as? String
                        
                        
                        if self.passResult?.count > 0 {
                            self.performSegueWithIdentifier("restaurantList", sender:self)
                        } else {
                            
                            let alert = UIAlertController(title: "NYTC", message:"No result found", preferredStyle: .Alert)
                            let action = UIAlertAction(title: "OK", style: .Default) { _ in
                            }
                            alert.addAction(action)
                            self.presentViewController(alert, animated: true){}
                            
                        }

                    })
                    
                }
            }
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "restaurantList" {
            
            let restaurentListVc = segue.destinationViewController as! restaurntListViewController
            
            restaurentListVc.getResultData = passResult
            
            restaurentListVc.isFromBasicSearch = true
            
        }
        
    }

    
    //MARK:Listing TableView Delegate
    func didSelectListItem(item: AnyObject!, index: Int) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
        selButton.setTitle(arr.objectAtIndex(index)as? String, forState:UIControlState.Normal)
        
        
        if selButton == radiusBtn {
            
            if index == 0 {
                
                radiusVal = "0"
                
            } else {
                
               radiusVal = arr.objectAtIndex(index)as? String
                
                 radiusVal = radiusVal.stringByReplacingOccurrencesOfString("(Miles)", withString: "")
            }
            
            
        } else if selButton == specialCuisineBtn {
            
            if index == 0 {
                
                cuisineVal = "0"
                
            } else {
                
                cuisineVal = arr.objectAtIndex(index)as? String
                
            }
            
            
        } else if selButton == specialOffersBtn {
            
           offerVal = String(index)
            
        }
    }

}
