//
//  LogController.swift
//  TravelDiary
//
//  Created by Esther on 9/22/22.
//

import Foundation

class LogController {
    
    // Singleton: ensures we are interacting with the same instance of our logs array. The singleton will pass around only this specific instance of our LogController
    static let sharedInstance = LogController()
    
    // Source of Truth:
    
    var logs: [Log] = [] // empty array gives default value, but this initializes every time the app is run and will return empty every time unless given only SINGLE source, which restricts initialization to only one time
    
    // MARK: - CRUD
    
    // goal to recieve these properties from user of app:
    func create(title: String, address: String, body: String) {
        let log = Log(title: title, address: address, body: body)
        logs.append(log)
        // when line 24 runs, a create log function is appended to the logs collection. Will add to it each time this code runs
    }
    
    func update(logToUpdate: Log, newTitle: String, newAddress: String, newBody: String) {
        logToUpdate.title = newTitle
        logToUpdate.address = newAddress
        logToUpdate.logDate = Date()
        logToUpdate.body = newBody
        
    }
    
    func delete(logtodelete:Log) {
        guard let indexOfLogToDelete = logs.firstIndex(of: logtodelete) else {return}
        logs.remove(at: indexOfLogToDelete)
        
        // function firstIndex(of: ) returns an optional, which is why we needed guard else
    }
    
} // End of Class
