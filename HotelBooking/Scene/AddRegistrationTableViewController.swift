//
//  AddRegistrationTableViewController.swift
//  HotelBooking
//
//  Created by Baris on 13.07.2023.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {

    //MARK: - UI Elements
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker : UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsDatePicker()
     

    }
    
    

  //MARK: - Actions
    @IBAction func doneBarButtonClicked(_ sender: UIBarButtonItem) {
        guard let name = firstNameTextField.text, let lastName = lastNameTextField.text, let email = emailTextField.text else { return }
        
        let checkOutDate = checkOutDatePicker.date
        let checkInDate = checkInDatePicker.date
    
        print("Name \(name)")
        print("Last Name \(lastName)")
        print("Email \(email)")
        print("Check In Date \(checkInDate)")
        print("Check Out Date \(checkOutDate)")
    }
    
    @IBAction func datePickerValueChanged(_ picker: UIPickerView) {
        updateDateViews()
    }
}



//MARK: - Helpers
extension AddRegistrationTableViewController {
    private func updateDateViews() {
        // 21/03/2023 -> .medium  -> March 21, 2023
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    private func settingsDatePicker() {
        let midnightToday = Calendar.current.startOfDay(for: Date())
        let oneDay : Double = 24 * 60 * 60
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(oneDay)
        
        checkInDatePicker.minimumDate = midnightToday
        checkOutDatePicker.date = midnightToday
    }
}



