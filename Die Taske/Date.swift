//
//  Date.swift
//  Die Taske
//
//  Created by Vishal Patel on 10/02/15.
//  Copyright (c) 2015 BitterMelonTech. All rights reserved.
//

import Foundation

class Date {
    
    //MARK:- from String to NSDate
    class func from (#year:Int, month:Int, day:Int) -> NSDate {
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalender = NSCalendar(identifier: NSGregorianCalendar)
        var date = gregorianCalender?.dateFromComponents(components)
        
        return date!
    }
    
    //MARK:- from NSDate to String
    class func toString(#date:NSDate) -> String {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateStringFormatter.stringFromDate(date)
        
        return dateString
    }
}