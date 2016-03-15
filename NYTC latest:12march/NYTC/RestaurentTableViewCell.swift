//
//  RestaurentTableViewCell.swift
//  NYTC
//
//  Created by Promatics on 3/5/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class RestaurentTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurentImage: UIImageView!
    
    @IBOutlet weak var viewMoreBtn: UIButton!
    
    @IBOutlet weak var restauentNameBtn: UIButton!
    
    @IBOutlet weak var cuisineLbl: UILabel!
    
    @IBOutlet weak var addressLbl: UILabel!
    
    @IBOutlet weak var distanceLbl: UILabel!
    
    @IBOutlet weak var firstBtn: UIButton!
    
    @IBOutlet weak var secBtn: UIButton!
    
    @IBOutlet weak var thirdBtn: UIButton!
    
    @IBOutlet weak var fourthbtn: UIButton!
    
    @IBOutlet weak var fifthBtn: UIButton!
    
    @IBOutlet weak var first_img: UIImageView!
    
    @IBOutlet weak var sec_img: UIImageView!
    
    @IBOutlet weak var third_img: UIImageView!
    
    @IBOutlet weak var fourth_img: UIImageView!
    
    @IBOutlet weak var fifth_img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
