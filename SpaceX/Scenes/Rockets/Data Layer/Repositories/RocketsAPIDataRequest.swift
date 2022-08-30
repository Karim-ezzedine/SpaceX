//
//  RocketsAPIDataRequest.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 30/08/2022.
//

import Foundation

class RocketsAPIDataRequest: RocketsDataRequestRepository {
    
    let rocketsAPI: RocketsAPI
    
    init() {
        rocketsAPI = RocketsAPI()
    }
    
    // MARK: - Get Rocket
    ////  Method Called in RocketViewModel -> getRocket() Function
    ////  Function created to fetch one rocket data selected by ID
   
    func getRocket(id: String, completion: @escaping (GenericResponseResult<Rocket>) -> Void) {
        rocketsAPI.getRockets(id: id) { result in
            switch result {
            case .success(let data):
                if data.count > 0, let rocket = data.first {
                    completion(GenericResponseResult(isValid: true, object: rocket))
                }
                else {
                    completion(GenericResponseResult(isValid: false, message: "Rocket Not Found", object: Rocket()))
                }
            case .failure(let error):
                if isDebug() {
                    print("getRocket Error: \(error.localizedDescription)")
                    completion(GenericResponseResult(isValid: false, message: error.localizedDescription, object: Rocket()))
                }
                else {
                    completion(GenericResponseResult(isValid: false, message: "Error fetching rocket data", object: Rocket()))
                }
            }
        }
    }
    
}
