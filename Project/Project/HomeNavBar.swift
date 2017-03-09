//
//  HomeNavBar.swift
//  Project
//
//  Created by 姚君 on 17/2/8.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

class HomeNavBar: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    let titleBtn = UIButton()

    func draw() {
    
        self.frame = CGRect(x: 0, y: 0, width: screenWidth, height: navNarHeight)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.orange
        
//        titleBtn.frame = CGRect(x: 0, y: 20, width: 320, height: 44)
        titleBtn.translatesAutoresizingMaskIntoConstraints = false
        titleBtn.backgroundColor = UIColor.red
        self.addSubview(titleBtn)
        
        
    }
    
}
