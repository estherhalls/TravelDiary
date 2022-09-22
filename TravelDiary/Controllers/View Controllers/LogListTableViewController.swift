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
        /// Telling the tableview to scale its cell height to its content
                tableView.rowHeight = UITableView.automaticDimension
                /// Giving the TableView an estimated height to start calculating from
                tableView.estimatedRowHeight = 70
    }
    override func viewWillAppear(_ animated: Bool) {
        /// When the view appears from the detailVC we need to reload the tableview to see the changes.
        tableView.reloadData()
    }
      
    // MARK: - Table view data source
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        /// Set our number of visual rows equal to the number of **Log** objects in our *logs* array.
        return LogController.sharedInstance.logs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// Setting the reuse Identifier to match the cells we designed on the storyboard. We also type cast our cell from a type UITableViewCell to our custom LogListTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "logCell", for: indexPath) as?
                LogListTableViewCell else {return UITableViewCell()}

        /// Using the *IndexPath* from the row to find what **Log** should be displayed
        let log = LogController.sharedInstance.logs[indexPath.row]
        // accesses array and runs the function the number of times equal to the count of items in the array
        
        /// Calling the buildCell method on our LogListTableViewCell
        cell.configureCell(with: log) // only works because we declared custom cell to replace default cell. Assigning the constant as a custom cell allows access to functions

        /// Passing the fully configured cell to be displayed
        return cell
    }
    
    
    /// This method is called when the user swipes to delete a row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            /// Finds the **Log** in the *logs* array that matches the *IndexPath* for the row
            let log = LogController.sharedInstance.logs[indexPath.row]
            LogController.sharedInstance.delete(logtodelete: log)/// Calles the *delete(log:)* method to delete the object
            /// Cleans up the dust by deleting the visable row:
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    



    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
        /// Identifier - We are checking to see if the identifier of our segue matches "toDetailVC". If it does then we will run the code inside, if not then we will just pass over it.
        if segue.identifier == "toDetailVC" {
            /// Index - Discovering what row the user has selected:
            if let index = tableView.indexPathForSelectedRow {
                /// Destination - Verifying the segues destination leads to the *ViewController* we want. This also allows us to access the properties on that *ViewController*
                if let destination = segue.destination as? LogDetailViewController {
                    /// Object to send - Using the index we discovered earlier we retrieve the *Log* that matches in our *logs* array.
                    let logToSend = LogController.sharedInstance.logs[index.row]
                    /// Object to receive - Sets the value of the optional *log* on the *destination* to the *Log* we just retrived.
                    destination.logReciever = logToSend
                }
                    
            }
            
        }
        
    }
    

} // End of Class
