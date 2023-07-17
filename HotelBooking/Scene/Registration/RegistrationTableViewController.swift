//
//  RegistrationTableViewController.swift
//  HotelBooking
//
//  Created by Baris on 17.07.2023.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    
    
    //MARK: - Properties
    var registrations = [Registration]()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: - Actions
    
    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        guard let source = unwindSegue.source as? AddRegistrationTableViewController, let registraion = source.registration else { return }
        
        
        registrations.append(registraion)
        print("tapped")
        tableView.reloadData()
    }
    
}


// MARK: - Table view data source

extension RegistrationTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return registrations.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "registrationCell")!
        
        let registration = registrations[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let checkInString = dateFormatter.string(from: registration.chechInDate)
        let checkOutString = dateFormatter.string(from: registration.checkOutDate)
        let roomName = registration.roomType.name
        
        cell.textLabel?.text = registration.fullName()
        cell.detailTextLabel?.text = "\(checkInString) - \(checkOutString): \(roomName)"
        
        // Configure the cell...
        
        return cell
    }
    
}
