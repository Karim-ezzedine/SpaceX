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
                
                var launches: Launches = []
                
                if let date = Calendar.current.date(byAdding: .year, value: -3, to: Date()) {
                    launches = data.filter({$0.isUpcoming || ($0.isSuccessful && $0.launchingDateSince1970 > Int(date.timeIntervalSince1970))})
                }
                else {
                    launches = data.filter({$0.isUpcoming || $0.isSuccessful})
                }
                
                print("Filtered Launches Total: \(launches.count)")
                completion(GenericResponseResult(isValid: true, object: launches))
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
