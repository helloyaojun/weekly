//
//  BaseHttpRequest.swift
//  Project
//
//  Created by 姚君 on 17/2/28.
//  Copyright © 2017年 certus. All rights reserved.
//

import Foundation
import Alamofire

class BaseHttpRequest {
    class func request(jsp: String, para: Dictionary<String, String>, success: @escaping (String)->Void, fail:@escaping (Error)->Void) {
    
        let url = httpDomain + jsp
        
        let manger = Alamofire.SessionManager.default
        manger.session.configuration.timeoutIntervalForRequest = 10
        manger.request(URL.init(string: url)!, method: .get, parameters: para, encoding: URLEncoding.default, headers: nil).responseString { (response) in
            
            switch(response.result){
                
            case .success(let jsonString):
                success(jsonString)
                break
                
            case .failure(let error):
                fail(error)
                break
                
            }
            
        }
    }
}
