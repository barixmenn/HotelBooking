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
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

  //MARK: - Actions
    @IBAction func doneBarButtonClicked(_ sender: UIBarButtonItem) {
        guard let name = firstNameTextField.text, let lastName = lastNameTextField.text, let email = emailTextField.text else { return }
        print("Name \(name)")
        print("Last Name \(lastName)")
        print("Email \(email)")
    }
}
