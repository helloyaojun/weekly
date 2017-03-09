//
//  ConfigurationCell.swift
//  Project
//
//  Created by 姚君 on 17/3/6.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

class ConfigurationCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        imageView.layer.cornerRadius = imageView.bounds.width/2
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor.lightGray
        
//        containerView.layer.borderWidth = 0.5
//        containerView.layer.borderColor = UIColor.gray.cgColor
    }

}
