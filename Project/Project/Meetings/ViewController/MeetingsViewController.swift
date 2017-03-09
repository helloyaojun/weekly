//
//  MeetingsViewController.swift
//  Project
//
//  Created by 姚君 on 17/2/10.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

class MeetingsViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.rowHeight = 180
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "MeetingCell", bundle: nil), forCellReuseIdentifier: "MeetingCell")
        navController.rightButton.addTarget(self, action: #selector(MeetingsViewController.addMeetingRecord), for: .touchUpInside)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navController.rightButton.isHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        let cell:MeetingCell = tableView.dequeueReusableCell(withIdentifier: "MeetingCell") as! MeetingCell
        
        cell.nameLabel.text = "nameLabel"
        cell.timeLabel.text = "timeLabel"
        cell.projectLabel.text = "projectLabelprojectLabelprojectLabelprojectLabelprojectLabelprojectLabel"
        cell.contentLabel.text = "contentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabel"

        return cell
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        let meetDetail = MeetingDetailViewController()
        self.navigationController?.pushViewController(meetDetail, animated: true)
        
    }
    
    func addMeetingRecord() {
        let meetDetail = MeetingDetailViewController()
        self.navigationController?.pushViewController(meetDetail, animated: true)

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
