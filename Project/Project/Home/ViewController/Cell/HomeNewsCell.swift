//
//  HomeNewsCell.swift
//  Project
//
//  Created by 姚君 on 17/2/10.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

class HomeNewsCell: UITableViewCell {

    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var timeL: UILabel!
    @IBOutlet weak var newsL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print(nameL)
        nameL.preferredMaxLayoutWidth = self.nameL.bounds.size.width
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
