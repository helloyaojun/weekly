//
//  ProductListViewController.swift
//  Project
//
//  Created by 姚君 on 17/3/7.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var typeText: UITextField!
    @IBOutlet weak var levelText: UITextField!
    @IBOutlet weak var statusText: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.rowHeight = 130
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ProjectCell", bundle: nil), forCellReuseIdentifier: "ProjectCell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell:ProjectCell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell") as! ProjectCell
        
        cell.nameLabel.text = "nameLabel"
        cell.typeLabel.text = "timeLabel"
        cell.produLineLabel.text = "云应用产品线"
        cell.levelLabel.text = "一般"
        cell.statusLabel.text = "开发中"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let productDetail = ProductDetailViewController()
        self.navigationController?.pushViewController(productDetail, animated: true)
        
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
