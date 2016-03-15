//
//  searchRestaurantViewController.swift
//  NYTC
//
//  Created by Promatics on 3/1/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class searchRestaurantViewController: UIViewController,UITableViewDelegate,UITextFieldDelegate,listingDelegate,UITabBarDelegate,UITabBarControllerDelegate {
   
    @IBOutlet weak var name_txt: UITextField!
    
    @IBOutlet weak var postCode_txt: UITextField!
    
    @IBOutlet weak var radius_btn: UIButton!
    
    @IBOutlet weak var search_btn: UIButton!
    
    @IBOutlet var filter_btn: UIBarButtonItem!
        
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var getTextField:UITextField?

    var isRadiusSelectec:Bool?
    
    var passResult:NSMutableArray? = NSMutableArray()
    
    var arr = NSArray(objects: "Any(Miles)","2(Miles)","5(Miles)","10(Miles)","100(Miles)","500(Miles)","1000(Miles)","2000(Miles)","3000(Miles)","4000(Miles)","5000(Miles)")

    var passRadius:String?
    
    let validation = Validation.validationManager() as! Validation
    
    let searchConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    var message = ""
    
    //MARK: View's Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

    self.title = "Search Reastaurants"
        
        isRadiusSelectec = false
        
        passRadius = "0"
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        navigationItem.rightBarButtonItem = filter_btn
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
        self.tabBarController?.delegate = self
        
        setInterface()
        
    }
    

    func setInterface() {
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad)  {
            
             let ipad_width = CGFloat(560)
                        
            name_txt.frame.size.height = 45
            
            name_txt.frame.size.width = ipad_width
            
            name_txt.frame.origin.x = self.view.frame.size.width/2 - name_txt.frame.size.width/2
            
            name_txt.font = UIFont(name: (name_txt.font?.fontName)!, size: 19)
            
            postCode_txt.frame.size.height = 45
            
            postCode_txt.frame.size.width = ipad_width
            
            postCode_txt.frame.origin.x = self.view.frame.size.width/2 - postCode_txt.frame.size.width/2
            
            postCode_txt.frame.origin.y = name_txt.frame.origin.y + name_txt.frame.size.height + 20
            
             postCode_txt.font = UIFont(name: (name_txt.font?.fontName)!, size: 19)
            
            radius_btn.frame.size.height = 45
            
            radius_btn.frame.size.width = ipad_width
            
            radius_btn.frame.origin.x = self.view.frame.size.width/2 - radius_btn.frame.size.width/2
            
            radius_btn.frame.origin.y = postCode_txt.frame.origin.y + postCode_txt.frame.size.height + 20
            
            radius_btn.titleLabel?.font = UIFont(name:(name_txt.font?.fontName)!, size: 19)
            
            radius_btn.imageEdgeInsets = UIEdgeInsetsMake(0, (radius_btn.frame.width - 30), 0, 0)
            
            search_btn.frame.size.height = 45
            
            search_btn.frame.size.width = ipad_width
            
            search_btn.frame.origin.x = self.view.frame.size.width/2 - search_btn.frame.size.width/2
            
            search_btn.frame.origin.y = radius_btn.frame.origin.y + radius_btn.frame.size.height + 40
            
            search_btn.titleLabel?.font = UIFont(name:(name_txt.font?.fontName)!, size: 21)
            
            
        } else {
            
             radius_btn.imageEdgeInsets = UIEdgeInsetsMake(5, (radius_btn.frame.width - 20), 5, 5)
            
        }
        
        

        
        
        let width = CGFloat(1.0)
        
        let name_txt_border = CALayer()
        
         name_txt_border.borderColor = UIColor.blackColor().CGColor
        
         name_txt_border.frame = CGRect(x: 0, y: name_txt.frame.size.height - width, width:  name_txt.frame.size.width, height: name_txt.frame.size.height)
        
        name_txt_border.borderWidth = width
        
        name_txt.layer.addSublayer(name_txt_border)
        
        name_txt.layer.masksToBounds = true
        
        name_txt.attributedPlaceholder = NSAttributedString(string:name_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let pass_border = CALayer()
        
        pass_border.borderColor = UIColor.blackColor().CGColor
        
        pass_border.frame = CGRect(x: 0, y: postCode_txt.frame.size.height - width, width:  postCode_txt.frame.size.width, height: postCode_txt.frame.size.height)
        
        pass_border.borderWidth = width
        
        postCode_txt.layer.addSublayer(pass_border)
        
        postCode_txt.layer.masksToBounds = true
        
        postCode_txt.attributedPlaceholder = NSAttributedString(string:postCode_txt.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
                
        search_btn.layer.cornerRadius = 5.0
        
        radius_btn.layer.borderWidth = 1.0
        
        radius_btn.layer.borderColor = UIColor.blackColor().CGColor
        
        self.indicator.hidden = true
        
        indicator.frame = self.view.frame
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
   
    //MARK: Button Actions
    
    @IBAction func tapRadius_btn(sender: AnyObject) {
        
        
        getTextField?.resignFirstResponder()
        
       // let story_board = UIStoryboard(name: "Main", bundle:nil)
        
        let listvc = storyboard!.instantiateViewControllerWithIdentifier("listingVC") as! ListingViewController
        
        listvc.delegate = self;
        
        listvc.selectedData = []
        
        listvc.isMultipleSelected = false
        
        listvc.array_data = arr.mutableCopy() as! NSMutableArray
        
        //var nav = UINavigationController(rootViewController:listvc)
        
        self.navigationController?.pushViewController(listvc, animated:true)
        
    }

    @IBAction func tap_filter_btn(sender: AnyObject) {
        
        self.performSegueWithIdentifier("advanceSearch", sender: self)

    }
    
    
   
    @IBAction func tapSearch_btn(sender: AnyObject) {
        
            message = ""
        
            if !validation.validateBlankField(postCode_txt.text) {
                
                message = "Please enter post code"
                
            }else if radius_btn.titleLabel?.text == "Select Radius"{
            
                message = "Please select radius"
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

                passDict = ["restaurantName":name_txt.text!,"postalCode":postCode_txt.text!,"distance":passRadius!,"user_id":(NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("id"))!,"device_id":deviceId!]
                
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
                            
                            self.radius_btn.setTitle("Select Radius", forState: UIControlState.Normal)
                            
                            self.passRadius = "0"
                            
                            self.postCode_txt.text = ""
                            
                            self.name_txt.text = ""
                            
                            self.passResult = arr?.valueForKey("result") as? NSMutableArray
                            
                            print(self.passResult?.count);
                            
                            
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
    
    //MARK: UITextField Delegate and DataSource
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        getTextField = textField
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder();
        
        return true
        
    }
    
    //MARK: ListingTableView Delegate
    
    func didSelectListItem(item: AnyObject!, index: Int) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
        radius_btn.setTitle(arr.objectAtIndex(index)as? String, forState:UIControlState.Normal)
        
        if index == 0 {
            
            passRadius = "0"
            
        } else {
            
            passRadius = arr.objectAtIndex(index)as? String
            
            passRadius = passRadius!.stringByReplacingOccurrencesOfString("(Miles)", withString: "")
        }
        
       print(passRadius)
        
    }
    
    //MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "restaurantList" {
            
            let restaurentListVc = segue.destinationViewController as! restaurntListViewController
            
           restaurentListVc.getResultData = passResult
            
           restaurentListVc.isFromBasicSearch = true
            
        }
        
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        self.navigationController?.popToRootViewControllerAnimated(false)
        
    }
}


