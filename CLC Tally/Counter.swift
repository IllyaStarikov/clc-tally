//
//  Counter.swift
//  CLC Tally
//
//  Created by Illya Starikov on 3/22/16.
//  Copyright © 2016 Illya Starikov. All rights reserved.
//

import Foundation

class Counter: CustomStringConvertible {
    
    public var count: Int {
        get {
            return userLog.count
        }
    }
    
    public var log: [(Int, Int, Int)] {
        if let dates = UserDefaults.standard.object(forKey: "log") as? [Date] {
            var descriptions = [(Int, Int, Int)]()
            
            for date in dates {
                descriptions.append(getTimeComponents(from: date))
            }
            
            return descriptions
        } else {
            return [(Int, Int, Int)]()
        }
    }
    
    private var userLog: [Date] {
        get {
            if let dates = UserDefaults.standard.object(forKey: "log") as? [Date] {
                return dates
            }
            
            return [Date]()
        } set {
            UserDefaults.standard.set(newValue as AnyObject, forKey: "log")
            UserDefaults.standard.synchronize()
        }
    }
    
    var description: String { get { return "\(count)" }}
    
    func update() {
        userLog.append(Date())
    }
    
    func reset() {
        userLog.removeAll(keepingCapacity: true)
    }
    
    func getTimeComponents(from date: Date) -> (Int, Int, Int) {
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        return (hour, minutes, seconds)
    }
    
}
