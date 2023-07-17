//
//  Registration.swift
//  HotelBooking
//
//  Created by Baris on 13.07.2023.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var emailAdress: String
    
    //date
    var chechInDate: Date
    var checkOutDate: Date
    
    //adults
    var numberOfAdults: Int
    var numberOfChildren : Int
    
    //room
    var roomType : RoomType
    var wifi: Bool
    
    //MARK: - Functions
     func fullName() -> String {
        return firstName + " " + lastName
    }
}
