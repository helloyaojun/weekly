//
//  WeekCell.swift
//  Project
//
//  Created by 姚君 on 17/2/13.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

class WeekCell: UITableViewCell {

    @IBOutlet weak var projectL: UILabel!
    @IBOutlet weak var thisWeek: UILabel!
    @IBOutlet weak var nextWeek: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
