//
//  BaseViewController.swift
//  Project
//
//  Created by 姚君 on 17/2/10.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var navController: BaseNavigationController! = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        navController = self.navigationController as! BaseNavigationController
        navController.titleButton.addTarget(self, action: #selector(BaseViewController.dropDepartment), for: .touchUpInside)
        navController.rightButton.isHidden = true
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func dropDepartment() {
    
        let titles = ["产品线1","产品线1","产品线1","云应用产品线","产品线1"]
        
        let dropTable = DropTable()
        dropTable.didSelectRow = {
            
            (indexPath)->Void in
            self.changeDepartment(indexPath: indexPath)
        }
        dropTable.initWith(point: CGPoint(x: screenWidth/2, y: 64), titles: titles, images: [])
        dropTable.show()

    }
    
    func changeDepartment(indexPath: IndexPath) {
        print("选中\(indexPath.row)")

    }

}
