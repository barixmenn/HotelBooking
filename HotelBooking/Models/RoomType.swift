//
//  RoomType.swift
//  HotelBooking
//
//  Created by Baris on 13.07.2023.
//

import Foundation

struct RoomType: Equatable{
    
    //MARK: - Properties
    
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    //MARK: - Functions
    static func == (lhs: RoomType, rhs: RoomType) -> Bool  {
        return lhs.id == rhs.id
    }
}
