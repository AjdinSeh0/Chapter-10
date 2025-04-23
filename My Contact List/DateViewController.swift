//
//  DateViewController.swift
//  My Contact List
//
//  Created by Ajdin Seho on 4/15/25.
//

import UIKit

protocol DateControllerDelegate: class {
    func dateChanged(date: Date)
}



class DateViewController: UIViewController {

    @IBOutlet weak var dtpDate: UIDatePicker!
    
    
    
    weak var delegate: DateControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save,
                                         target: self,
                                         action: #selector(saveDate))
        
        self.navigationItem.rightBarButtonItem = saveButton
        self.title = "Pick Birthdate"
    }

    @objc func saveDate() {
        self.delegate?.dateChanged(date: dtpDate.date)
        self.navigationController?.popViewController(animated: true)
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
