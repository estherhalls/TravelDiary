//
//  LogController.swift
//  TravelDiary
//
//  Created by Esther on 9/22/22.
//

import Foundation

class LogController {
    
    /// Singleton: To ensure that we are interacting with the *SAME* instance of our *logs* array we created a singleton and will pass around this specific instance of our **LogController**
    
    static let sharedInstance = LogController()
    
    /// Source of Truth: The single location we will store our **Log** data.
    
    var logs: [Log] = [] // empty array gives default value, but this initializes every time the app is run and will return empty every time unless given only SINGLE source, which restricts initialization to only one time
    
    // MARK: - CRUD
    
    // goal to recieve these properties from user of app:
    /**
         Creates a Log object using the data provided by the View Controller
         - Properties:
         - title: The *Sring* identifier for the Log.
         - address: The *String* representation for where the user was.
         - body: The *String* representation of what the user enjoyed about this event.
         */
    func create(title: String, address: String, body: String) {
        let log = Log(title: title, address: address, body: body)
        logs.append(log)
        // when line 24 runs, a create log function is appended to the logs collection. Will add to it each time this code runs
    }
    /**
         Updates a Log object using the data provided by the View Controller
         - Properties:
         - logToUpdate: The *Log* object whose data will be updated.
         - newTitle: The  new *Sring* identifier for the **Log**.
         - newAddress: The new *String* representation for where the user was.
         - newBody: The new *String* representation of what the user enjoyed about this event.
         */
    func update(logToUpdate: Log, newTitle: String, newAddress: String, newBody: String) {
        logToUpdate.title = newTitle
        logToUpdate.address = newAddress
        logToUpdate.logDate = Date()
        logToUpdate.body = newBody
        
    }
    /**
         Deletes a Log object
         - Properties:
         - logToDelete: The *Log* object to delete. Deleting the log object also removes any other data associated with it. I.E. -The Title, Body, and so on.
         */
    func delete(logtodelete:Log) {
        guard let indexOfLogToDelete = logs.firstIndex(of: logtodelete) else {return}
        logs.remove(at: indexOfLogToDelete)
        
        // function firstIndex(of: ) returns an optional, which is why we needed guard else
    }
    
} // End of Class
