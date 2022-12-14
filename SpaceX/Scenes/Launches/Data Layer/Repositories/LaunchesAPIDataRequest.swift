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
    
    // MARK: - Get Launches
    ////  Method Called in LaunchesViewModel -> getLaunches() Function
    ////  Function created to fetch and filter localy the launches data
    ////  Filtiring condition: successful and upcoming rocket launches for the last 3 years .
    
    func getLaunches(page: Int, completion: @escaping (GenericResponseResult<GetLaunchesResult>) -> Void) {
        launchesAPI.getLaunches(page: page) { result in
            switch result {
            case .success(let data):
                print("getLaunches Total: \(data.launches.count)")
                
                var launches: Launches = []
                
                if let date = Calendar.current.date(byAdding: .year, value: -3, to: Date()) {
                    launches = data.launches.filter({$0.isUpcoming || ($0.isSuccessful && $0.launchingDateSince1970 > Int(date.timeIntervalSince1970))})
                }
                else {
                    launches = data.launches.filter({$0.isUpcoming || $0.isSuccessful})
                }
                
                print("Filtered Launches Total: \(launches.count)")
                completion(GenericResponseResult(isValid: true, object: GetLaunchesResult(launches: launches, hasNextPage: data.hasNextPage, page: data.page)))
            case .failure(let error):
                if isDebug() {
                    print("getLaunches Error: \(error.localizedDescription)")
                    completion(GenericResponseResult(isValid: false, message: error.localizedDescription, object: GetLaunchesResult()))
                }
                else {
                    completion(GenericResponseResult(isValid: false, message: "Error fetching rockets launches data", object: GetLaunchesResult()))
                }
            }
        }
    }
    
}
