//
//  RocketsFakeDataRequest.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 30/08/2022.
//

import Foundation

class RocketsFakeDataRequest: RocketsDataRequestRepository {
    
    // MARK: - Get Rocket
    ////  Method Called in RocketViewModel -> getRocket() Function.
    ////  Function created to create a hardcoded Rocket data for test mode.
    
    func getRocket(id: String, completion: @escaping (GenericResponseResult<Rocket>) -> Void) {
        
        let rocket = Rocket(
            flickrImages: ["https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg"],
            name: "Falcon Heavy",
            wikipedia: "https://en.wikipedia.org/wiki/Falcon_Heavy",
            description: "With the ability to lift into orbit over 54 metric tons (119,000 lb)--a mass equivalent to a 737 jetliner loaded with passengers, crew, luggage and fuel--Falcon Heavy can lift more than twice the payload of the next closest operational vehicle, the Delta IV Heavy, at one-third the cost.",
            id: "5e9d0d95eda69974db09d1ed"
        )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(GenericResponseResult(isValid: true, object: rocket))
        }
    }
    
}
