//
//  Log.swift
//  TravelDiary
//
//  Created by Esther on 9/22/22.
//

import Foundation

// Title, Address, Date, Body

class Log {
    
    // MARK: - Properties
    // var if allowing user to change them
    var title: String
    var address: String
    var logDate: Date
    var body: String
    
    // MARK: - Initializer
    // date assignment creates date automatically
    init(title: String, address: String, logDate: Date = Date(), body: String){
        self.title = title
        self.address = address
        self.logDate = logDate
        self.body = body
        
    } // End of Init

} // End of Class

// Extending Log function to adopt (line 35) and conform (the rest) to the equatable protocol
// This gives logs a way to compare themselves to other logs so that we can index and delete entries in model controller
extension Log: Equatable {
    static func == (lhs: Log, rhs: Log) -> Bool {
        return lhs.title == rhs.title &&
        lhs.address == rhs.address &&
        lhs.body == rhs.body &&
        lhs.logDate == rhs.logDate
    }
    
    
}
