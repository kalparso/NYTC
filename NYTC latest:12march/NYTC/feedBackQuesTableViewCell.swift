//
//  feedBackQuesTableViewCell.swift
//  NYTC
//
//  Created by Promatics on 3/10/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class feedBackQuesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var quesNo_lbl: UILabel!
    
    @IBOutlet weak var question_lbl: UILabel!
    
    @IBOutlet weak var boxesView: UIView!
    
    @IBOutlet weak var excellent_box: UIButton!
    
    @IBOutlet weak var veryGood_box: UIButton!
    
    @IBOutlet weak var good_box: UIButton!
    
    @IBOutlet weak var fair_box: UIButton!
    
    @IBOutlet weak var poor_box: UIButton!
    
    @IBOutlet weak var feedBack_btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
