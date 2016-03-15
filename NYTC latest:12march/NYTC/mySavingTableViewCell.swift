//
//  mySavingTableViewCell.swift
//  NYTC
//
//  Created by promatics on 3/15/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class mySavingTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurent_name_lbl: UILabel!
    
    @IBOutlet weak var pay_amount_lbl: UILabel!
    
    @IBOutlet weak var date_lbl: UILabel!
    @IBOutlet weak var save_amount_lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
