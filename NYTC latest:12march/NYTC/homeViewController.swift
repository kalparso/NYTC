
import UIKit

class homeViewController: UIViewController {

    
    @IBOutlet weak var all_line_img: UIImageView!
    
    @IBOutlet weak var digitalCard_img: UIImageView!
    
    @IBOutlet weak var how_it_work_img: UIImageView!
    
    @IBOutlet weak var myFab_res_img: UIImageView!
    
    @IBOutlet weak var search_res_img: UIImageView!
    
    @IBOutlet weak var memberShip_img: UIImageView!
    
    @IBOutlet weak var invite_friend_img: UIImageView!
        
    @IBOutlet weak var digitalCard_btn: UIButton!
    
    @IBOutlet weak var how_it_work_btn: UIButton!
    
    @IBOutlet weak var myFav_res_btn: UIButton!
    
    @IBOutlet weak var search_res_btn: UIButton!
    
    @IBOutlet weak var memberShip_btn: UIButton!
    
    @IBOutlet weak var inviteFriend_btn: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Home"
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
        setInterface()
        
        

    }
    
    func setInterface() {
        
         if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            
        let fontSize = CGFloat(21)

        digitalCard_btn.titleLabel?.font = UIFont(name:(digitalCard_btn.titleLabel?.font?.fontName)!, size: fontSize)
            
        how_it_work_btn.titleLabel?.font = UIFont(name:(how_it_work_btn.titleLabel?.font?.fontName)!, size: fontSize)
            
        myFav_res_btn.titleLabel?.font = UIFont(name:(myFav_res_btn.titleLabel?.font?.fontName)!, size: fontSize)
            
         search_res_btn.titleLabel?.font = UIFont(name:(search_res_btn.titleLabel?.font?.fontName)!, size: fontSize)
            
        memberShip_btn.titleLabel?.font = UIFont(name:(memberShip_btn.titleLabel?.font?.fontName)!, size: fontSize)
            
        inviteFriend_btn.titleLabel?.font = UIFont(name:(inviteFriend_btn.titleLabel?.font?.fontName)!, size: fontSize)
        }
       
        digitalCard_img.frame.origin.x = (digitalCard_btn.frame.size.width/2-digitalCard_img.frame.size.width/2)
        
        digitalCard_img.frame.origin.y = (digitalCard_btn.frame.size.height/2-digitalCard_img.frame.size.height/2)-20
        
        how_it_work_img.frame.origin.x = (how_it_work_btn.frame.size.width/2-how_it_work_img.frame.size.width/2)
        
        how_it_work_img.frame.origin.y = ((how_it_work_btn.frame.size.height/2-how_it_work_img.frame.size.height/2)-20) + how_it_work_btn.frame.origin.y
        
        myFab_res_img.frame.origin.x = (myFav_res_btn.frame.size.width/2-myFab_res_img.frame.size.width/2)
        
        myFab_res_img.frame.origin.y = ((myFav_res_btn.frame.size.height/2-myFab_res_img.frame.size.height/2)-20) + myFav_res_btn.frame.origin.y
        
        search_res_img.frame.origin.x = (search_res_btn.frame.size.width/2-search_res_img.frame.size.width/2) + search_res_btn.frame.origin.x
        
        search_res_img.frame.origin.y = (search_res_btn.frame.size.height/2-search_res_img.frame.size.height/2)-20
        
        memberShip_img.frame.origin.x = (memberShip_btn.frame.size.width/2-memberShip_img.frame.size.width/2) + memberShip_btn.frame.origin.x
        
        memberShip_img.frame.origin.y = ((memberShip_btn.frame.size.height/2-memberShip_img.frame.size.height/2)-20) + memberShip_btn.frame.origin.y
        
        invite_friend_img.frame.origin.x = (inviteFriend_btn.frame.size.width/2-invite_friend_img.frame.size.width/2) + inviteFriend_btn.frame.origin.x
        
        invite_friend_img.frame.origin.y = ((inviteFriend_btn.frame.size.height/2-invite_friend_img.frame.size.height/2)-20) + inviteFriend_btn.frame.origin.y
        
        print(NSUserDefaults.standardUserDefaults().valueForKey("userData"))
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func tapDigitalCard_btn(sender: AnyObject) {
        
        self.performSegueWithIdentifier("digitalCard", sender: self)
    }
    
    @IBAction func tapHow_it_work_btn(sender: AnyObject) {
    }
    
    @IBAction func tapFav_ras_btn(sender: AnyObject) {
    
        self.performSegueWithIdentifier("favRest", sender: self)
    }
    
    @IBAction func tapSearch_res_btn(sender: AnyObject) {
        
        //searchRestauarant restaurantList advanceSearch
        
        self.performSegueWithIdentifier("searchRestauarant", sender: self)
    }
    
    @IBAction func tapMembership_btn(sender: AnyObject) {
        
        
        let sharingItems = ["https://play.google.com/store/apps/details?id=com.vastukripa"]
        
        let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        
        //if iPhone
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone) {
            
            self.presentViewController(activityViewController, animated: true, completion: nil)
        } else {
            
            let popoverCntlr = UIPopoverController(contentViewController: activityViewController)
            popoverCntlr.presentPopoverFromRect(CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 0, 0), inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
            
        }
        
    }
    
    @IBAction func tapInviteFriend_btn(sender: AnyObject) {
    }
}
