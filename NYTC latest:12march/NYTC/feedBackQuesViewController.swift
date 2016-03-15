//
//  feedBackQuesViewController.swift
//  NYTC
//
//  Created by Promatics on 3/10/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class feedBackQuesViewController: UIViewController,UITableViewDelegate {
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var feedBack_table: UITableView!
    
    var cell : feedBackQuesTableViewCell!
        
    var checkBoxArr:NSMutableArray? = NSMutableArray()
    
    var quesArr:NSMutableArray? = NSMutableArray()
    
    var paramDict:NSMutableDictionary? = NSMutableDictionary()
    
    var message:NSString!
    
    var rest_id:NSString?
    
    let qustionFeedbakConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    let feedbackSubConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = "Feedback"
        
        feedBack_table.hidden = true
        
        indicator.frame = self.view.frame
        
        CallWebServices()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func CallWebServices(){
        
        let deviceId = NSUserDefaults.standardUserDefaults().valueForKey("device_ID")
        
        let user_id =  (NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("id"))!
        
        self.indicator.hidden = false
        
        self.indicator.startAnimating()
        
        var passDict = [String:AnyObject]()
        
        passDict = ["device_id":deviceId!,"user_id":user_id]
        
        print("DictData: ")
        
        print(passDict)
      qustionFeedbakConn.startConnectionWithString("feedBackQuestion", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
            
            print(receivedData)
            
            
            if self.qustionFeedbakConn.responseCode() == 1 {
                
                self.indicator.stopAnimating()
                
                self.indicator.hidden = true
                
                dispatch_async(dispatch_get_main_queue(),{
                    
                    var arr:NSDictionary?
                    
                    arr = receivedData
                    
                    self.quesArr = arr?.valueForKey("result") as? NSMutableArray
                  
                    for var index = 0; index < self.quesArr!.count; ++index {
                        
                        self.checkBoxArr?.addObject(0)
                        
                    }
                    
                    print(self.quesArr)
                    
                    self.feedBack_table.hidden = false
                    
                    self.feedBack_table.reloadData()
                    
                })
                
            }else{
                
                
                let alert = UIAlertController(title: "NYTC", message:"some error", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default) { _ in
                }
                alert.addAction(action)
                self.presentViewController(alert, animated: true){}
            }
        }
        
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return (checkBoxArr!.count)+1
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        cell  = tableView.dequeueReusableCellWithIdentifier("cell") as! feedBackQuesTableViewCell
        
        if(cell == nil)
        {
            cell = NSBundle.mainBundle().loadNibNamed("cell", owner: self, options: nil)[0] as! feedBackQuesTableViewCell
            
        }
        
       
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad){
            
           cell.question_lbl.font = UIFont(name: (cell.question_lbl.font?.fontName)!, size: 19)
            
            cell.boxesView.frame.origin.y = 45
            
            cell.feedBack_btn.titleLabel?.font = UIFont(name: (cell.feedBack_btn.titleLabel?.font?.fontName)!, size: 19)
            
            cell.feedBack_btn.frame.size.height  = 45
            
            cell.feedBack_btn.frame.size.width = 560
            
            cell.feedBack_btn.frame.origin.x = self.view.frame.size.width/2 - cell.feedBack_btn.frame.size.width/2
            
            cell.excellent_box.titleLabel?.font = UIFont(name: (cell.excellent_box.titleLabel?.font?.fontName)!, size: 19)
            
            cell.excellent_box.frame.size.height = 30

            
            cell.excellent_box.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 90)
            
             cell.excellent_box.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 80)
            
            
           cell.veryGood_box.titleLabel?.font = UIFont(name: (cell.veryGood_box.titleLabel?.font?.fontName)!, size: 19)
            
            cell.veryGood_box.frame.size.height = 30

            cell.veryGood_box.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 90)
            
            cell.veryGood_box.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 80)
            
           cell.good_box.titleLabel?.font = UIFont(name: (cell.good_box.titleLabel?.font?.fontName)!, size: 19)
            
            cell.good_box.frame.size.height = 30
            
            cell.good_box.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 90)
            
            cell.good_box.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 80)
            
           cell.fair_box.titleLabel?.font = UIFont(name: (cell.fair_box.titleLabel?.font?.fontName)!, size: 19)
            
           cell.fair_box.frame.size.height = 30
            
           cell.fair_box.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 90)
            
            cell.fair_box.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 80)
            
            cell.poor_box.titleLabel?.font = UIFont(name: (cell.poor_box.titleLabel?.font?.fontName)!, size: 19)
            
            cell.poor_box.frame.size.height = 30

            cell.poor_box.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 90)
            
            cell.poor_box.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 80)
        }
        

        
        if indexPath.row == quesArr!.count {
            
            cell.feedBack_btn.hidden = false
            
            cell.feedBack_btn.layer.cornerRadius = 5
            
            cell.boxesView.hidden = true
            
            cell.quesNo_lbl.hidden = true
            
            cell.question_lbl.hidden = true
            
            cell.feedBack_btn.addTarget(self, action:"tapSubmitFeedBack_btn:", forControlEvents: UIControlEvents.TouchUpInside)
            
        } else {
            
            cell.feedBack_btn.hidden = true
            
            cell.boxesView.hidden = false
            
            cell.quesNo_lbl.hidden = false
            
            cell.question_lbl.hidden = false
            
            cell.question_lbl.text = quesArr!.objectAtIndex(indexPath.row).valueForKey("FeedBackQuestion")?.valueForKey("question") as? String
            
            
            cell.excellent_box.addTarget(self, action: "Excellent:", forControlEvents: UIControlEvents.TouchUpInside)
            
            cell.excellent_box.tag = indexPath.row
            
            cell.veryGood_box.addTarget(self, action: "VeryGood:", forControlEvents: UIControlEvents.TouchUpInside)
            
            cell.veryGood_box.tag = indexPath.row
            
            cell.good_box.addTarget(self, action: "Good:", forControlEvents: UIControlEvents.TouchUpInside)
            
            cell.good_box.tag = indexPath.row
            
            cell.fair_box.addTarget(self, action: "Fair:", forControlEvents: UIControlEvents.TouchUpInside)
            
            cell.fair_box.tag = indexPath.row
            
            cell.poor_box.addTarget(self, action: "Poor:", forControlEvents: UIControlEvents.TouchUpInside)
            
            cell.poor_box.tag = indexPath.row
            
            if (checkBoxArr?.objectAtIndex(indexPath.row))! as! Int == 0 {
                
                cell.excellent_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.veryGood_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.good_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.fair_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.poor_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
            } else  if (checkBoxArr?.objectAtIndex(indexPath.row))! as! Int == 1{
                
                cell.excellent_box.setImage(UIImage(named: "checkBox"), forState: UIControlState.Normal)
                
                cell.veryGood_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.good_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.fair_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.poor_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                
            } else  if (checkBoxArr?.objectAtIndex(indexPath.row))! as! Int == 2{
                
                
                cell.veryGood_box.setImage(UIImage(named: "checkBox"), forState: UIControlState.Normal)
                
                
                cell.excellent_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                
                cell.good_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.fair_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.poor_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
            } else  if (checkBoxArr?.objectAtIndex(indexPath.row))! as! Int == 3{
                
                
                cell.good_box.setImage(UIImage(named: "checkBox"), forState: UIControlState.Normal)
                
                
                cell.excellent_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.veryGood_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                
                cell.fair_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.poor_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
            } else  if (checkBoxArr?.objectAtIndex(indexPath.row))! as! Int == 4{
                
                cell.fair_box.setImage(UIImage(named: "checkBox"), forState: UIControlState.Normal)
                
                cell.excellent_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.veryGood_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.good_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                
                
                cell.poor_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
            }else  if (checkBoxArr?.objectAtIndex(indexPath.row))! as! Int == 5{
                
                
                cell.poor_box.setImage(UIImage(named: "checkBox"), forState: UIControlState.Normal)
                
                
                cell.excellent_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.veryGood_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.good_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                cell.fair_box.setImage(UIImage(named: "boxBackground"), forState: UIControlState.Normal)
                
                
            }
            
            
            cell.quesNo_lbl.text = String(indexPath.row+1)
            
            cell.quesNo_lbl.text = cell.quesNo_lbl.text! + "."

        }
        
         cell.question_lbl.frame.size.width = self.view.frame.width -  cell.question_lbl.frame.origin.x - cell.quesNo_lbl.frame.origin.y
        
        cell.question_lbl.sizeToFit()
        // cell.question_lbl
        
        cell.selectionStyle =   UITableViewCellSelectionStyle.None
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    
      func Excellent(sender:UIButton){
        
        
        if (checkBoxArr?.objectAtIndex(sender.tag))! as! Int == 1{
            
            checkBoxArr?.replaceObjectAtIndex(sender.tag, withObject: 0)
            
            
            
            
            feedBack_table.reloadData()
            
        }else {
            
            checkBoxArr?.replaceObjectAtIndex(sender.tag, withObject: 1)
            
            
            
            
            feedBack_table.reloadData()
        }
        
        
        
    }
    
    func VeryGood(sender:UIButton){
        
        if (checkBoxArr?.objectAtIndex(sender.tag))! as! Int == 2{
            
            checkBoxArr?.replaceObjectAtIndex(sender.tag, withObject: 0)
            
            feedBack_table.reloadData()
        }else {
            
            checkBoxArr?.replaceObjectAtIndex(sender.tag, withObject: 2)
            
            feedBack_table.reloadData()
        }
       
       
    }
    
    func Good(sender:UIButton){
        
        if (checkBoxArr?.objectAtIndex(sender.tag))! as! Int == 3{
            
            checkBoxArr?.replaceObjectAtIndex(sender.tag, withObject: 0)
            
            feedBack_table.reloadData()
            
        }else {
            
            checkBoxArr?.replaceObjectAtIndex(sender.tag, withObject: 3)
            
            
            
            
            feedBack_table.reloadData()
        }
        
        
    }
    
    func Fair(sender:UIButton){
        
        
        if (checkBoxArr?.objectAtIndex(sender.tag))! as! Int == 4{
            
            checkBoxArr?.replaceObjectAtIndex(sender.tag, withObject:0)
            
            feedBack_table.reloadData()
            
        } else {
            
            checkBoxArr?.replaceObjectAtIndex(sender.tag, withObject: 4)
            
            
            
            
            feedBack_table.reloadData()
        }
        
    }
    
    func Poor(sender:UIButton){
        
        
        if (checkBoxArr?.objectAtIndex(sender.tag))! as! Int == 5{
            
            checkBoxArr?.replaceObjectAtIndex(sender.tag, withObject: 0)
            
            feedBack_table.reloadData()
            
        }else {
            
            checkBoxArr?.replaceObjectAtIndex(sender.tag, withObject: 5)
            
            
            
            feedBack_table.reloadData()
        }
        
    }
    
    func tapSubmitFeedBack_btn(sender:UIButton){
      
       message = ""
        
        for var index = 0; index < self.checkBoxArr!.count; ++index {
            
           
            if (checkBoxArr?.objectAtIndex(index))! as! NSObject == 0 {
                
                message = "Please select all questions."
                
                 break
            }
            
        }
        
        
        if message.length > 0 {
            
          let alert = UIAlertController(title: "NYTC", message:message! as String, preferredStyle: .Alert)
            
          let action = UIAlertAction(title: "Ok", style: .Default, handler: { (UIAlertAction) -> Void in
            
          })
            
         alert.addAction(action)
            
         self.presentViewController(alert, animated: false, completion: { () -> Void in
           
         })
            
        } else {
            
            let deviceId = NSUserDefaults.standardUserDefaults().valueForKey("device_ID")
            
            let user_id =  (NSUserDefaults.standardUserDefaults().valueForKey("userData")?.valueForKey("id"))!
            
            self.indicator.hidden = false
            
            self.indicator.startAnimating()
            
            var passDict = [NSString:AnyObject]()
            
            
           //
            //user_id,device_id,restaurant_id,array( ans[ question_id ] )
            
            //paramDict?.setValue(deviceId, forKey: "device_id")
            
            
            passDict = (passDict as? [String:AnyObject])!
            
            print(rest_id)
            
            
            passDict["device_id"] = deviceId!
            
            passDict["user_id"] = user_id
            
            passDict["restaurant_id"] = rest_id!
            
            
            for var index = 0; index < self.quesArr!.count; ++index {
                
               cell.quesNo_lbl.text = "ans["
                
              cell.quesNo_lbl.text  = quesArr!.objectAtIndex(index).valueForKey("FeedBackQuestion")?.valueForKey("id") as? String
                
                message =  NSString(format:"ans[%@]",               cell.quesNo_lbl.text!)

               passDict[message] = checkBoxArr?.objectAtIndex(index)
                
                print(passDict)
            }
            
            
       // passDict = ["device_id":deviceId!,"user_id":user_id,"restaurant_id":rest_id!]
            
            
            print("DictData:")
            
            print(passDict)
            feedbackSubConn.startConnectionWithString("feedBack", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
                
                print(receivedData)
                
                
                if self.feedbackSubConn.responseCode() == 1 {
                    
                    self.indicator.stopAnimating()
                    
                    self.indicator.hidden = true
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        
                        var arr:NSDictionary?
                        
                        arr = receivedData
                        
                       
                       self.message = arr?.valueForKey("message") as! String
                        
                      let result_code = arr?.valueForKey("response") as? String
                        
                        if result_code == "1" {
                            
                            let alert = UIAlertController(title: "NYTC", message:"Your feedback has been successfully submitted.", preferredStyle: .Alert)
                            let action = UIAlertAction(title: "OK", style: .Default) { _ in
                                
                                self.navigationController?.popViewControllerAnimated(true)
                                
                            }
                            
                            alert.addAction(action)
                            
                            self.presentViewController(alert, animated: true){}
                            
                        } else  if result_code == "0"{
                            
                            let alert = UIAlertController(title: "NYTC", message:"Your have already submitted your feedback for this restaurant.", preferredStyle: .Alert)
                            let action = UIAlertAction(title: "OK", style: .Default) { _ in
                                
                                self.navigationController?.popViewControllerAnimated(true)
                                
                            }
                            
                            alert.addAction(action)
                            
                            self.presentViewController(alert, animated: true){}
                            
                        }
                        
                       // self.feedBack_table.reloadData()
                        
                    })
                    
                } else {
                    
                    self.indicator.stopAnimating()
                    
                    self.indicator.hidden = true
                    
                    let alert = UIAlertController(title: "NYTC", message:"some error", preferredStyle: .Alert)
                    let action = UIAlertAction(title: "OK", style: .Default) { _ in
                    }
                    
                    alert.addAction(action)
                    
                    self.presentViewController(alert, animated: true){}
                }
            }
            
        }
    }

}
