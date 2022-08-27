//
//  LaunchesAPIDataRequest.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 27/08/2022.
//

import Foundation

class LaunchesAPIDataRequest: LaunchesDataRequestRepository {
    
    let launchesAPI: LaunchesAPI
    
    init() {
        launchesAPI = LaunchesAPI()
    }
    
    func getLaunches(completion: @escaping (GenericResponseResult<Launches>) -> Void) {
        launchesAPI.getLaunches { result in
            switch result {
            case .success(let data):
                print("getLaunches Total: \(data.count)")
                completion(GenericResponseResult(isValid: true, object: data))
            case .failure(let error):
                if isDebug() {
                    print("getLaunches Error: \(error.localizedDescription)")
                    completion(GenericResponseResult(isValid: false, message: error.localizedDescription, object: []))
                }
                else {
                    completion(GenericResponseResult(isValid: false, message: "Error fetching rockets launches data", object: []))
                }
            }
        }
    }
    
}
