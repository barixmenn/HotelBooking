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
    
    static var all : [RoomType] {
        return [
        RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 170),
        RoomType(id: 1, name: "One King ", shortName: "K", price: 190),
        RoomType(id: 2, name: "Suit", shortName: "S", price: 210)
        ]
    }
}
