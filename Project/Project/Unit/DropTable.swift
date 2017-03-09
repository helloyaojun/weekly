//
//  DropTable.swift
//  Project
//
//  Created by 姚君 on 17/2/20.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit


class DropTable: UIView,UITableViewDelegate,UITableViewDataSource {

    let kArrowHight = CGFloat(10.0)
    let kArrowCurvature = CGFloat(6.0)
    let space = CGFloat(2.0)
    let row_height = CGFloat(35.0)
    let titleFont = UIFont.systemFont(ofSize: 16)
    
    var tableView: UITableView! = nil
    var handerView: UIButton! = nil
    var showPoint: CGPoint! = nil
    var titleArray: Array<String> = []
    var imageArray: Array<UIImage> = []
    
    var didSelectRow:((IndexPath)->())?
    
    func initWith(point: CGPoint, titles:Array<String>, images:Array<UIImage>) {

        showPoint = point
        titleArray = titles
        imageArray = images
        
        self.backgroundColor = UIColor.clear
        self.frame = self.getFrame()
        tableView = UITableView(frame: CGRect(x: space, y: kArrowHight + space, width: self.frame.width - 2*space, height: self.frame.height - space - kArrowHight - 1), style: .plain)
        tableView.rowHeight = row_height
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        self.addSubview(tableView)
    }
    
    override func draw(_ rect: CGRect) {
        
        let frame = CGRect(x: 0, y: kArrowHight, width: self.bounds.width, height: self.bounds.height-kArrowHight)
        let xMin = frame.minX
        let yMin = frame.minY
        let xMax = frame.maxX
        let yMax = frame.maxY
        
        let arrowPoint = self.convert(showPoint, from: handerView)
        let popoverPath = UIBezierPath()
        popoverPath.move(to: CGPoint(x: xMin, y: yMin))
        popoverPath.addLine(to: CGPoint(x: arrowPoint.x - kArrowHight, y: yMin))
        popoverPath.addCurve(to: arrowPoint, controlPoint1: CGPoint(x: arrowPoint.x - kArrowHight + kArrowCurvature, y: yMin), controlPoint2: arrowPoint)
        popoverPath.addCurve(to: CGPoint(x: arrowPoint.x + kArrowHight, y: yMin), controlPoint1: arrowPoint, controlPoint2: CGPoint(x: arrowPoint.x + kArrowHight - kArrowCurvature, y: yMin))
        popoverPath.addLine(to: CGPoint(x: xMax, y: yMin))
        popoverPath.addLine(to: CGPoint(x: xMax, y: yMax))
        popoverPath.addLine(to: CGPoint(x: xMin, y: yMax))
        UIColor.darkGray.setFill()
        popoverPath.fill()
        popoverPath.close()
        popoverPath.stroke()
        
    }
    
    func getFrame() ->CGRect {
    
        var frame = CGRect.zero
        let count = titleArray.count
        frame.size.height = CGFloat(count) * row_height + kArrowHight
        
        for title in titleArray {
        
            let textSize = title.boundingRect(with: CGSize(width: 300, height: 100), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: titleFont], context: nil)
            frame.size.width = max(textSize.width, frame.size.width)
        }
        
        if titleArray.count == imageArray.count {
            frame.size.width = 10 + 25 + 10 + frame.size.width + 40
        }else {
            frame.size.width = 10 + frame.size.width + 40
        }
        frame.origin.x = self.showPoint.x - frame.size.width/2
        frame.origin.y = self.showPoint.y
        
        if frame.origin.x < 5 {
            frame.origin.x = 5
        }
        
        if frame.origin.x + frame.width > screenWidth - 5 {
            frame.origin.x = screenWidth - 5 - frame.size.width
        }
        
        return frame
    }
    
    func show() {
    
        handerView = UIButton(type: .custom)
        handerView.frame = UIScreen.main.bounds
        handerView.backgroundColor = UIColor.clear
        handerView.addTarget(self, action: #selector(DropTable.hide), for: .touchUpInside)
        handerView.addSubview(self)
        let window = UIApplication.shared.keyWindow
        window?.addSubview(handerView)
    }
 
    func hide() {
    
        handerView.removeFromSuperview()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let indentifier: String = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: indentifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: indentifier)
        }
        cell!.backgroundColor = UIColor.darkGray
        if imageArray.count == titleArray.count {
            cell?.imageView?.image = imageArray[indexPath.row] as UIImage
        }
        cell!.textLabel?.font = titleFont
        cell!.textLabel?.textColor = UIColor.white
        cell!.textLabel?.text = titleArray[indexPath.row]
        cell!.textLabel?.textAlignment = NSTextAlignment.center
        cell!.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        self.hide()
        didSelectRow?(indexPath)
    }


}
