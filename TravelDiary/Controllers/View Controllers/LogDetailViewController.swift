//
//  LogDetailViewController.swift
//  TravelDiary
//
//  Created by Esther on 9/22/22.
//

import UIKit

class LogDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var logDateLabel: UILabel!
    @IBOutlet weak var logTitleTextField: UITextField!
    @IBOutlet weak var logAddressTextField: UITextField!
    @IBOutlet weak var logBodyTextView: UITextView!
    
    // Reciever:
    var logReciever: Log?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // goal of updateUI func is to DISPLAY change to the user. From a log to the view elements:
    func updateUI() {
        guard let log = logReciever else {return}
        logTitleTextField.text = log.title
        logAddressTextField.text = log.address
        logBodyTextView.text = log.body
        logDateLabel.text = log.logDate.stringValue()
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
      
        guard let title = logTitleTextField.text,
        let address = logAddressTextField.text,
        let body = logBodyTextView.text
        else {return}
        
        if let log = logReciever {
        // if log reciever has a value then the user is trying to update
            LogController.sharedInstance.update(logToUpdate: log, newTitle: title, newAddress: address, newBody: body)
        } else {
        // if log reciever has no value then the user is trying to create
            LogController.sharedInstance.create(title: title, address: address, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
}
