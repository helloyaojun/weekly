//
//  ProjectService.swift
//  Project
//
//  Created by 姚君 on 17/2/27.
//  Copyright © 2017年 certus. All rights reserved.
//

import Foundation

typealias SuccessBlock = (Dictionary<String, Any>)->Void
typealias ErrorBlock = (String)->Void

class ProjectService {
    
    func getProjectServiceList(para: Dictionary<String, String>, success:@escaping (Dictionary<String, Any>)->Void, fail:@escaping (String)->Void) {
        
        BaseHttpRequest.request(jsp: "wholequality", para: para, success: { (jsonString) in
            
            let model:QualityInfoList? = JSONDeserializer<QualityInfoList>.deserializeFrom(json: jsonString)
            let array = model?.qualityInfoList
            if array != nil {
                success(["response":array!])
            }else {
                let result:FailModel = (model?.result)!
                fail(result.msg!)
            }
        }) { (error) in
            fail(error.localizedDescription)
        }
    }
}
