//
//  LogListTableViewCell.swift
//  TravelDiary
//
//  Created by Esther on 9/22/22.
//

import UIKit

class LogListTableViewCell: UITableViewCell {
    @IBOutlet weak var logNameLabel: UILabel!
    @IBOutlet weak var logAddressLabel: UILabel!
    @IBOutlet weak var logDateLabel: UILabel!
    
    /// This method is called when we want to build the UI of the cell
    func configureCell(with log: Log){
       // value of title freom log assigned to text property of log name
        logNameLabel.text = log.title
        logAddressLabel.text = log.address
        logDateLabel.text = log.logDate.stringValue()
    }
    

}
