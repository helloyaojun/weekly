//
//  ProjectDetailViewController.swift
//  Project
//
//  Created by 姚君 on 17/2/16.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

class ProjectDetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        let dic:Dictionary<String, Any?> = ["time":"2017.2.20","salesman":"2月16日，阿里方面对新京报记者回应称：“对于新零售，阿里巴巴毫无疑问在全力积极探索，这就是不争的商业的未来。对于市场传言我们暂不评论，一旦有最新的消息，我们第一时间与大家沟通"]
        
        let html = joinHtml(dic: dic)
        webView .loadHTMLString(html, baseURL: nil)
        webView.scrollView.bounces = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func joinHtml(dic:Dictionary<String, Any?>) -> String {
        
        let time: String = dic["time"] as! String
        let salesman: String = dic["salesman"] as! String
        
        var html = "<!DOCTYPEhtml><html><head> <meta charset=\"utf-8\"> <title>项目详情</title> </head><body><div style=\"font-size:15px\"><section><span>项目时间：</span><span>"+time+"</span><br><span>销售：</span><span>"+salesman+"</span><br><span>项目金额：</span><span>"+salesman+"</span><br><span>项目经理：</span><span>"+salesman+"</span><br><span>项目背景：</span><span>"+salesman+"</span><br><span>项目风险：</span><span>"+salesman+"</span></section><div>交流记录:</div><table border=\"1\"cellspacing=\"0\"align=\"left\"><tr><th>时间</th><th>会议名称</th><th>会议地点</th><th>客户名称</th><th>参会人员</th><th>记录人员</th><th>会议概要</th></tr>"

        
        for i in 0...1 {
            var recordHtml = "<tr><td>"+time+"</td><td>"+salesman+"</td><td>"+salesman+"</td><td>"+salesman+"</td><td>"+salesman+"</td><td>"+salesman+"</td><td>"+salesman+"</td></tr>"
            html.append(recordHtml)
        }
        html.append("</table><br><div>项目进展:</div><table border=\"1\"cellspacing=\"0\"align=\"left\"><tr><th>时间</th><th>本周工作</th><th>下周计划</th></tr>")
        
        for i in 0...1 {
            var progressHtml = "<tr><td>"+time+"</td><td>"+salesman+"</td><td>"+salesman+"</td></tr>"
            html.append(progressHtml)
        }
        html.append("</table></div></body></html>")

        
        return html
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
