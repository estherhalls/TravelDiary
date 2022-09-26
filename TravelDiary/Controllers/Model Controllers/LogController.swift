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
    /// This is a property because it is a variable declared inside of our class
    /// empty array gives default value, but this initializes every time the app is run and will return empty every time unless given only SINGLE source, which restricts initialization to only one time
    /// private controls the access to this data, just like static
    
    private(set) var logs: [Log] = []
    
    // initializer for LogController file. So the very first time we initialize, we load the persisting data
    init() {
        load()
    }
    
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
        
        save()
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
        
        save()
    }
    /**
         Deletes a Log object
         - Properties:
         - logToDelete: The *Log* object to delete. Deleting the log object also removes any other data associated with it. I.E. -The Title, Body, and so on.
         */
    func delete(logtodelete:Log) {
        guard let indexOfLogToDelete = logs.firstIndex(of: logtodelete) else {return}
        logs.remove(at: indexOfLogToDelete)
        
        save()
        
        // function firstIndex(of: ) returns an optional, which is why we needed guard else
    }
    
    // MARK: - Persistence
    // Need the URL - which is a property. Source of truth - also a property
    // make it private because the other files ONLY NEED TO SEE the source of truth.. not the user's phone
    // if you open a scope after the type declaration, it is no longer a PROPERTY - it is now a COMPUTED PROPERTY: scope creates VALUE for the Computed Property
    private var fileURL: URL? {
        //.default is a singleton that Apple has created for the FileManager so we are always accessing the same one!
        /// Retrieve the first available  URL that is on the correct level to save user data -> within the users documents folder on their phone (standard location)
        /// "logs.json" is saving your source of truth into the data type that user's computer can read
        guard let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let finalURL = documentsDirectoryURL.appendingPathComponent("logs.json")
        return finalURL
    }
    
    // Need to save the URL
    // This code will always be the same except the name of the SOT
    func save() {
        // do we have a valid save location?
        guard let saveLocation = fileURL else {return}
        // convert the logs (SOT) into raw data (JSON)
        // if a call can THROW - you need to write a DO, TRY, CATCH (does by trying and will catch the error)
        do {
            // do this by TRY
            let data = try JSONEncoder().encode(logs)
            // write the data to the url
            /// write(to:) is a throwing function
            try data.write(to: saveLocation)
        } catch let error {
            print(error)
        }
        
    }
    
    // Need to load from the URL
    func load() {
        guard let loadLocation = fileURL else {return}
        do {
            // initializing data from contents of given URL
            let data = try Data(contentsOf: loadLocation)
            let decodedLogs = try JSONDecoder().decode([Log].self, from: data)
            // use newly loaded data as your SOT, .self is how we defined the type
            self.logs = decodedLogs
        } catch let error {
            print(error)
        }
    }
    
    
} // End of Class
