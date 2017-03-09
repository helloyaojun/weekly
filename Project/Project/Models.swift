//
//  Models.swift
//  Project
//
//  Created by 姚君 on 17/3/7.
//  Copyright © 2017年 certus. All rights reserved.
//

import Foundation

//会议
struct Meeting: HandyJSON {
    var id: Int?
    var time: String?
    var securityLevel: String?
    var detail: String?
    var partner: String?
    var customerName: String?
    var recorder: String?
    var place: String?
    var remark: String?
    var projectId: Int?
    var insertTime: String?
    var project: String?
}

//首页最新消息
struct HomeNews: HandyJSON {
    var projectName: String?
    var updateTime:String?
    var updateContent:String?
}

//项目
class Project: HandyJSON {
    var id: Int?
    var name: String?
    var type: String?
    var level: String?
    var status: String?
    var times: String?
    var saleman: String?
    var manager: String?
    var productLineId: Int?
    var background: String?
    var risk: String?
    var goal: String?
    var insertTime: String?
    var productLine: String?
    var option: String?
    var meetings: Array<Meeting>?
    
    required init() {}
}

//项目列表
class ProjectList: HandyJSON {
    var projectList: Array<Project>?
    
    required init() {}
}

//产品线
class ProductLine: HandyJSON {
    var id: Int?
    var name: String?
    var manager: String?
    var work: String?
    var insertTime: String?
    var users: Array<User>?
    var projects: Array<Project>?
    
    required init() {}
}

//人员
class User: HandyJSON {
    var id: Int?
    var username: String?
    var password: String?
    var enabled: Bool?
    var productLineId: Int?
    var productLine: String?
    var roleIds: String?
    var roles: String?
    var projectIds: String?
    var projects: Array<Project>?
    var productLineName: String?
    var option: String?
    
    required init() {}
}

//人员所在项目
struct UserProject: HandyJSON {
    var id: Int?
    var username: String?
    var projectId: Int?
}

//人员访问日志
struct UserProjectVisiteLog: HandyJSON {
    var id: Int?
    var username: String?
    var projectId: Int?
    var visiteTime: String?
    var latestMeetingId: Int?
    var latestWeeklyPaperId: Int?
    
}

//人员角色
struct UserRole: HandyJSON {
    var id: Int?
    var username: String?
    var roleId: Int?
}

//角色
struct Role: HandyJSON {
    var id: Int?
    var name: String?
}

//周报
struct WeeklyPaper: HandyJSON {
    var id: Int?
    var title: String?
    var startDate: String?
    var endDate: String?
    var thisWeekWorks: String?
    var nextWeekPlans: String?
    var author: String?
    var insertTime: String?
    var projectId: Int?
    
}

//请求失败
struct FailModel: HandyJSON{
    var code: String?
    var msg: String?
}

class QualityInfoList: HandyJSON {
    var qualityInfoList: Array<Quality>?
    var result: FailModel?
    
    required init() {}
}

struct Quality: HandyJSON{
    var homeAlarmRate: String?
    var inquiryType: String?
    var monitorUserCount: String?
    var mosAlarmHighTimeRate: String?
    var mosAlarmHighUserRate: String?
    var networkAlarmRate: String?
    var platAlarmRate: String?
    var watchTime: String?
    var watchUserCount: String?
    var wirelessUserRate: String?
}
