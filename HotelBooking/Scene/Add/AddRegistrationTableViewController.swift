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
    
    @IBOutlet weak var numberOfAdultsLabel : UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    
    @IBOutlet weak var numberOfChildrenLabel : UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    
    
    //MARK: - Properties
    let checkInDateLabelIndexPath = IndexPath(row: 0, section: 1)
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    
    let checkOutDateLabelIndexPath = IndexPath(item: 2, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    
    var isCheckInDatePickerShown : Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown : Bool = false {
        didSet {
            checkOutDateLabel.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    var registration: Registration? {
        guard let roomType = roomType else { return nil }
        
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let email = emailTextField.text!
        let checkOutDate = checkOutDatePicker.date
        let checkInDate = checkInDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hashWifi = wifiSwitch.isOn
        
        return Registration(firstName: firstName, lastName: lastName, emailAdress: email, chechInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, roomType: roomType, wifi: hashWifi)
    }
    
    var roomType : RoomType?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsDatePicker()
        updateNumberOfGuests()
        updateRoomType()
        
        
        
    }
    
    
    
    //MARK: - Actions
    @IBAction func cancelButtonClicked(_ sender: UIBarButtonItem) {
     dismiss(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ picker: UIPickerView) {
        updateDateViews()
    }
    
    @IBAction func stepperValueChanged(_ stepper: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchValueChanged(_ switch: UISwitch) {
        
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
    
    private func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    private func settingsDatePicker() {
        let midnightToday = Calendar.current.startOfDay(for: Date())
        let oneDay : Double = 24 * 60 * 60
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(oneDay)
        
        checkInDatePicker.minimumDate = midnightToday
        checkOutDatePicker.date = midnightToday
    }
    
    private func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "No set"
        }
    }
}


//MARK: - TableViewDelegate
extension AddRegistrationTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectRoomType" {
            let destination = segue.destination as? SelectRoomTypeTableViewController
            destination?.delegate = self
            destination?.selectedRoomType = roomType
        }
    }
    
    //height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath :
            
            if isCheckInDatePickerShown {
                return 216
            } else {
                return 0
            }
            
        case checkOutDatePickerCellIndexPath:
            if isCheckOutDatePickerShown {
                return 216
            } else {
                return 0
            }
        default:
            return 44
        }
    }
    
    //select
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath {
        case checkInDateLabelIndexPath:
            
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            } else if isCheckInDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            } else {
                isCheckInDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case checkOutDateLabelIndexPath:
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            } else if isCheckInDatePickerShown {
                isCheckOutDatePickerShown = true
                isCheckInDatePickerShown = false
            } else {
                isCheckOutDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
        default:
            break
        }
    }
}


//MARK: - SelectRoomTypeTableViewControllerDelegate
extension AddRegistrationTableViewController: SelectRoomTypeTableViewControllerDelegate {
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
}

