//
//  WeeksInYear.swift
//  Project
//
//  Created by 姚君 on 17/2/16.
//  Copyright © 2017年 certus. All rights reserved.
//

import Foundation

class WeeksInYear
{
    func genrateWeeks(num:Int) -> Array<String> {
        var array: Array<String> = []
        
        for i in 0...num-1 {
            
            array.append(gWeek(index: i, sumWeek: num))
        }
        
        return array
    }
    
    func gWeek(index: Int, sumWeek: Int)->String {
        
        let nowDate = Date()
        
        let calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
        var component = calendar.dateComponents([.year,.month,.day,.weekday,.weekdayOrdinal,.weekOfYear,.weekOfMonth], from: nowDate)
        print(component)
        
        let weekday = component.weekday
        let day = component.day
        
        let weekDiff = (index - sumWeek + 1)*7
        var firstDiff = 0
        var lastDiff = 0
        if weekday == 1 {
            firstDiff = -6 + weekDiff
            lastDiff = weekDiff
        }else {
            
            firstDiff = calendar.firstWeekday - weekday! + 1 + weekDiff
            lastDiff = 8 - weekday! + weekDiff
        }
        component.day = day! + firstDiff
        let firstDayOfWeek = calendar.date(from: component)
        
        component.day = day! + lastDiff
        let lastDayOfWeek = calendar.date(from: component)
        
        let dateFormatter = DateFormatter.init()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let firstDay = dateFormatter.string(from: firstDayOfWeek!)
        dateFormatter.dateFormat = "MM.dd"
        let lastDay = dateFormatter.string(from: lastDayOfWeek!)
        let week = firstDay + "-" + lastDay
        
        return week
    }

}

