//
//  LogListTableViewController.swift
//  TravelDiary
//
//  Created by Esther on 9/22/22.
//

import UIKit

class LogListTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
      
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return LogController.sharedInstance.logs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "logCell", for: indexPath) as?
                LogListTableViewCell else {return UITableViewCell()}

        let log = LogController.sharedInstance.logs[indexPath.row]
        // accesses array and runs the function the number of times equal to the count of items in the array
        
        cell.configureCell(with: log) // only works because we declared custom cell to replace default cell. Assigning the constant as a custom cell allows access to functions

        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let log = LogController.sharedInstance.logs[indexPath.row]
            LogController.sharedInstance.delete(logtodelete: log)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    



    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
        if segue.identifier == "toDetailVC" {
            if let index = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? LogDetailViewController {
                    let logToSend = LogController.sharedInstance.logs[index.row]
                    destination.logReciever = logToSend
                }
                    
            }
            
        }
        
    }
    

} // End of Class
