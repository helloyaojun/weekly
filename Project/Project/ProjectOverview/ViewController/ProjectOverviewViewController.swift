//
//  ProjectOverviewViewController.swift
//  Project
//
//  Created by 姚君 on 17/2/10.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

class ProjectOverviewViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var dataList:Array<Quality>? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProjectCell")
        requestQualityInfoList()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    let service = ProjectService()

    func requestQualityInfoList() {
    
        service.getProjectServiceList(para: ["inquiryType":"2"], success: { (dic) in
            
            self.dataList = dic["response"] as! Array<Quality>?
            self.tableView .reloadData()
            
        }) { (errorMsg) in
            print(errorMsg)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        guard dataList != nil else {
            return 0
        }
        return dataList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath)
        cell.textLabel?.numberOfLines = 3
        let quality = dataList?[indexPath.row]
        
        cell.textLabel?.text = (quality?.inquiryType)!+(quality?.monitorUserCount)!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        let projectDetail = ProjectDetailViewController()
        self.navigationController?.pushViewController(projectDetail, animated: true)
        
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
