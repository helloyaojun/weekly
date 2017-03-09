//
//  ViewController.swift
//  Project
//
//  Created by 姚君 on 17/2/6.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    
    let vcNames = ["HomeViewController","ProjectOverviewViewController","MeetingsViewController","WeeklyManagementViewController","ConfigurationViewController"]
    let tabNames = ["首页","项目概况","会议管理","周报管理","系统配置"]

    var vcTemp: Array<UIViewController> = []
    var vcs: Array<UIViewController> {
        get {
            for vcName in vcNames {
                let VClass = NSClassFromString(nameSpace+"."+vcName) as! UIViewController.Type
                let vc = VClass.init()
                let nav = BaseNavigationController(rootViewController: vc)

                let index = vcNames.index(of: vcName)
                let item = UITabBarItem(title: tabNames[index!], image: UIImage.init(named: "icon_tab_1_selected"), selectedImage: UIImage.init(named: "icon_tab_1_selected"))
                nav.tabBarItem = item
                
                vcTemp += [nav]
            }
            print("vcs=",vcTemp)
            return vcTemp
        }
        set {
            vcTemp = newValue
        }
    }
    
//    let navBar = HomeNavBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        self.viewControllers = vcs
        
//        let navBar = HomeNavBar()
//        self.view.addSubview(navBar)
        
//        let test: TestViewController = TestViewController()
//        self.view.addSubview(test.view)
        

    }

//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        
//        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[navBar]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["navBar" :navBar]))
//        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[navBar]-0-|", options: .alignAllTop, metrics: nil, views: ["navBar" :navBar]))
//
//        navBar.reset()
//    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.        
    }


}

