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
    @IBOutlet weak var logTitleLable: UITextField!
    @IBOutlet weak var logAddressLabel: UITextField!
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var logTitleTextField: UITextField!
    @IBOutlet weak var logAddressTextField: UITextField!
    @IBOutlet weak var logBodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
