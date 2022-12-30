//
//  DatePickerViewController.swift
//  Homeowner
//
//  Created by Catherine Shing on 12/29/22.
//

import UIKit

class DatePickerViewController: UIViewController {
    var datePicker: UIDatePicker!
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("datepicker load")
        datePicker = UIDatePicker()
        showDatePicker()
    }
    
    func showDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        self.title = "Select date"
        datePicker.date = item.dateCreated
        self.view.addSubview(datePicker)

        datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      item.dateCreated = datePicker.date
    }
    
    
}
