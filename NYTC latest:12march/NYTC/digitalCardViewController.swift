//
//  digitalCardViewController.swift
//  NYTC
//
//  Created by Promatics on 3/1/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class digitalCardViewController: UIViewController,UITabBarDelegate,UITabBarControllerDelegate {
    
    @IBOutlet weak var back_view: UIView!
    @IBOutlet weak var card_view: UIView!
    @IBOutlet weak var logo_img: UIImageView!
    
    @IBOutlet weak var showCard_btn: UIButton!
    @IBOutlet weak var top_lbl: UILabel!
    
    @IBOutlet weak var tokenNo_lbl: UILabel!
    
    @IBOutlet weak var yourToken_lbl: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var ok_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      self.title = "Digital Card"
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
         self.navigationController?.navigationItem.leftBarButtonItem?.title = " "

        self.tabBarController?.delegate = self
        
       setInterface()
    
    }
    
    func setInterface() {
     
        card_view.hidden = true
        
        showCard_btn.layer.cornerRadius = 5.0
        
        ok_btn.layer.cornerRadius = 5.0
        
        card_view.frame.origin.x = self.view.frame.size.width/2 - card_view.frame.size.width/2
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad)  {
            
        let ipad_width = CGFloat(560)
            
         showCard_btn.frame.size.width = ipad_width
            
         showCard_btn.frame.size.height = 45
            
         showCard_btn.frame.origin.x = self.view.frame.size.width/2 - showCard_btn.frame.size.width/2
            
         showCard_btn.frame.origin.y = self.view.frame.size.height/2 - showCard_btn.frame.size.height/2
   
         showCard_btn.titleLabel?.font = UIFont(name:(showCard_btn.titleLabel?.font?.fontName)!, size: 19)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func tapOkCard_btn(sender: AnyObject) {
        
        card_view.hidden = true
    }
   
    @IBAction func tapShowCard_btn(sender: AnyObject) {
        
       card_view.hidden = false
        
    }
    
        
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        self.navigationController?.popToRootViewControllerAnimated(false)
        
    }
}
