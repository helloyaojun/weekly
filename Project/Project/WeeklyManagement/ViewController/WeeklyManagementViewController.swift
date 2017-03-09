//
//  WeeklyManagementViewController.swift
//  Project
//
//  Created by 姚君 on 17/2/10.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

let weeks = 52
let pickerHeight: CGFloat = 80

class WeeklyManagementViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var timeBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var dataList: NSMutableArray! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navController.rightButton.addTarget(self, action: #selector(WeeklyManagementViewController.addWeeklyRecord), for: .touchUpInside)

        tableView.rowHeight = 160
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "WeekCell", bundle: nil), forCellReuseIdentifier: "WeekCell")
        
        drawPicker()
        hidePicker()
        timeBtn.addTarget(self, action: #selector(WeeklyManagementViewController.timeBtnClick), for: .touchUpInside)

        let json = "{\"content\":[{\"project\":\"广电\",\"thisWeek\":\"1、完成了XXXXXX\\n1、完成了XXXXXX\\n1、完成了XXXXXX\",\"nextWeek\":\"1、完成了XXXXXX\\n1、完成了XXXXXX\\n1、完成了XXXXXX\"},{\"project\":\"广电\",\"thisWeek\":\"1、完成了XXXXXX\\n1、完成了XXXXXX\\n1、完成了XXXXXX\",\"nextWeek\":\"1、完成了XXXXXX\\n1、完成了XXXXXX\\n1、完成了XXXXXX\"},{\"project\":\"广电\",\"thisWeek\":\"1、完成了XXXXXX\\n1、完成了XXXXXX\\n1、完成了XXXXXX\",\"nextWeek\":\"1、完成了XXXXXX\\n1、完成了XXXXXX\\n1、完成了XXXXXX\"}]}"
        let dic = try? JSONSerialization.jsonObject(with: json.data(using: .utf8)!, options: JSONSerialization.ReadingOptions.mutableContainers)
        if let dict:Dictionary = dic as? Dictionary<String,NSMutableArray>{
            dataList = dict["content"]
        }
        print(dic)
        
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navController.rightButton.isHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var thisWeek = ""
    var weekArray:Array<String> = []
    
    func timeBtnClick() {
    
        let weeksInYear = WeeksInYear()
        weekArray = weeksInYear.genrateWeeks(num: weeks)
        picker.reloadAllComponents()
        
        showPicker()
//        picker.selectRow(0, inComponent: weeks-1, animated: true)

    }
    var picker:UIPickerView! = nil
    var accView:AccessoryView! = nil
    
    func drawPicker(){
    
        picker = UIPickerView(frame: CGRect(x: 0, y: self.view.bounds.height-pickerHeight, width: screenWidth, height: pickerHeight+20))
        picker.backgroundColor = UIColor.lightGray
        picker.dataSource = self
        picker.delegate = self
        self.view.addSubview(picker)
        
        accView = AccessoryView.init(frame: CGRect(x: 0, y: self.view.bounds.height-pickerHeight-40, width: screenWidth, height: 40))
        self.view.addSubview(accView)
        accView.sureBtn.addTarget(self, action: #selector(WeeklyManagementViewController.sureBtnClick), for: .touchUpInside)
        accView.cancelBtn.addTarget(self, action: #selector(WeeklyManagementViewController.cancelBtnClick), for: .touchUpInside)

    }
    var selectedWeekIndex = 0
    
    func sureBtnClick() {
    
        timeBtn.setTitle(thisWeek, for: .normal)
        hidePicker()
    }
    func cancelBtnClick() {
        hidePicker()
    }

    func showPicker(){
    
        picker.isHidden = false
        accView.isHidden = false
    }
    
    func hidePicker() {
    
        picker.isHidden = true
        accView.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weekArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return screenWidth
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        thisWeek = weekArray[row]
        return thisWeek
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        selectedWeekIndex = component
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell:WeekCell = tableView.dequeueReusableCell(withIdentifier: "WeekCell", for: indexPath) as! WeekCell
        let dic = dataList[0] as! Dictionary<String,String>
        
        cell.projectL.text = dic["project"]
        cell.thisWeek.text = dic["thisWeek"]
        cell.nextWeek.text = dic["nextWeek"]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        let weekDetail = WriteWeeklyViewController()
        self.navigationController?.pushViewController(weekDetail, animated: true)
    }
    
    func addWeeklyRecord() {
        let weekDetail = WriteWeeklyViewController()
        self.navigationController?.pushViewController(weekDetail, animated: true)
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
