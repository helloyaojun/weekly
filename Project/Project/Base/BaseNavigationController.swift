//
//  BaseNavigationController.swift
//  Project
//
//  Created by 姚君 on 17/2/17.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    var titleButton: UIButton! = nil
    var rightButton: UIButton! = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleButton = UIButton(frame: CGRect(x: (screenWidth-200)/2, y: 0, width: 200, height: 44))
        titleButton.setTitle("产品线", for: .normal)
        titleButton.setTitleColor(UIColor.black, for: .normal)
        self.navigationBar.addSubview(titleButton)

        rightButton = UIButton(frame: CGRect(x: screenWidth-64, y: 0, width: 44, height: 44))
        rightButton.setImage(UIImage.init(named: "icon_tab_1_selected"), for: .normal)
        rightButton.setTitleColor(UIColor.black, for: .normal)
        self.navigationBar.addSubview(rightButton)

        self.navigationBar.backgroundColor = UIColor.red
        self.navigationBar.isMultipleTouchEnabled = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(self.navigationBar)
        print(self)
        
//        self.titleButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[titleButton]-50-|", options: .directionLeftToRight, metrics: nil, views: ["titleButton":titleButton]))
//        self.titleButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[titleButton(44)]", options: .alignAllTop, metrics: nil, views: ["titleButton":titleButton]))
        
//        rightButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[rightButton(44)]-0-|", options: .alignAllRight, metrics: nil, views: ["rightButton":rightButton]))
//        rightButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[rightButton(44)]", options: .alignAllTop, metrics: nil, views: ["rightButton":rightButton]))

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
