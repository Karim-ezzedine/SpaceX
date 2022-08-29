//
//  Launches.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 26/08/2022.
//

import Foundation
import Alamofire

class GetLaunchesResult: Codable {
    let launches: Launches
    
    enum CodingKeys: String, CodingKey {
        case launches = "docs"
    }
}

typealias Launches = [Launche]

class Launche: Codable {
    
    private let id: String?
    private let flightNumber: Int?
    private let dateUTC: String?
    private let dateUnix: Int?
    private let upcoming: Bool?
    private let name: String?
    private let rocket: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case flightNumber = "flight_number"
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case upcoming
        case name
        case rocket
    }
    
    init(id: String? = nil, flightNumber: Int? = nil, dateUTC: String? = nil, dateUnix: Int? = nil, upcoming: Bool? = nil, name: String? = nil, rocket: String? = nil) {
        self.id = id
        self.flightNumber = flightNumber
        self.dateUTC = dateUTC
        self.dateUnix = dateUnix
        self.upcoming = upcoming
        self.name = name
        self.rocket = rocket
    }
    
    var flightNumberValue: String {
        return flightNumber != nil ? String(flightNumber!) : ""
    }
    
    var launchingDate: String {
        if let date = appDelegate.dataDateFormat.date(from: dateUTC ?? "") {
            let dateString = appDelegate.dateFormat.string(from: date)
            return dateString
        }
        else  {
            return ""
        }
    }
}
