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
    
    let id: String?
    let flightNumber: Int?
    let dateUTC: String?
    let dateUnix: Int?
    let upcoming: Bool?
    let name: String?
    let rocket: String?
    
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
}
