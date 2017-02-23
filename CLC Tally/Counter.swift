//
//  Counter.swift
//  CLC Tally
//
//  Created by Illya Starikov on 3/22/16.
//  Copyright © 2016 Illya Starikov. All rights reserved.
//

import Foundation

class Counter: CustomStringConvertible {
    
    fileprivate var counter: Int {
        get {
            return userLog.count
        } 
    }
    
    fileprivate var startValue = 0
    fileprivate var firstTap = true
    fileprivate var currentHour = 0
    
    var userLog: [String] {
        get {
            if let returnValue = UserDefaults.standard.object(forKey: "log") as? [String] {
                return returnValue
            } else {
                return [String]()
            }
        } set {
            UserDefaults.standard.set(newValue, forKey: "log")
            UserDefaults.standard.synchronize()
        }
// REFERENCE 
//        var food: [String] {
//            get {
//                if let returnValue = NSUserDefaults.standardUserDefaults().objectForKey("food") as? [String] {
//                    return returnValue
//                } else {
//                    return ["muesli", "banana"] //Default value
//                }
//            }
//            set {
//                NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "food")
//                NSUserDefaults.standardUserDefaults().synchronize()
//            }
//        }

    }
    
    fileprivate var startTime = Counter.nextHourDate()
    
    var description: String { get { return "\(counter)" }}
    var value: String { get { return "\(counter)" }}
    var initialValue: String { get { return "\(startValue)" }}
    
    
    fileprivate var hoursSincePassed: Int {
        get {
            if let start = startTime {
                let calendar = Calendar.current
                let date = Date()
                let currentMinutes = (calendar as NSCalendar).components(NSCalendar.Unit.minute, from: date).minute
                let startMinutes = (calendar as NSCalendar).components(NSCalendar.Unit.minute, from: start).minute
            
                return Int(abs(startMinutes! - currentMinutes!) / 60)
            }
            
            return 0
        }
    }
    
    func update() {
        func getTimeDescription() -> String? {
            let date = Date()
            let calendar = Calendar.current
            let hours = (calendar as NSCalendar).components(NSCalendar.Unit.hour, from: date)
            let minutes = (calendar as NSCalendar).components(NSCalendar.Unit.minute, from: date)
            let seconds = (calendar as NSCalendar).component(NSCalendar.Unit.second, from: date)
            
            return "\(hours):\(minutes):\(seconds)"
        }
        
        userLog.append(getTimeDescription()!)
    }
    
    func reset() {
        userLog.removeAll(keepingCapacity: true)
    }
    
    var shouldPresentAlert: Bool {
        get {
            if hoursSincePassed > currentHour {
                currentHour += 1
                return true
            }
            return false
        }
    }
    
    static func nextHourDate() -> Date? {
        let calendar = Calendar.current
        let date = Date()
        let minuteComponent = (calendar as NSCalendar).components(NSCalendar.Unit.minute, from: date)
        var components = DateComponents()
        components.minute = 60 - minuteComponent.minute!
        return (calendar as NSCalendar).date(byAdding: components, to: date, options: NSCalendar.Options())
    }
    
}
