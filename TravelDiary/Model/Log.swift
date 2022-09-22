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
