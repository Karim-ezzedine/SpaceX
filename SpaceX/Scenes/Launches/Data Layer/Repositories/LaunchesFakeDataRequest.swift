//
//  LaunchesFakeDataRequest.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 27/08/2022.
//

import Foundation

class LaunchesFakeDataRequest: LaunchesDataRequestRepository {
    
    // MARK: - Get Launches
    ////  Method Called in LaunchesViewModel -> getLaunches() Function.
    ////  Function created to create a hardcoded launches data for test mode.
    
    func getLaunches(page: Int, completion: @escaping (GenericResponseResult<GetLaunchesResult>) -> Void) {
        var launches: Launches = []
        
        launches.append(Launche(id: "1", flightNumber: 15, dateUTC: "2022-04-29T21:27:00.000Z", dateUnix: 1651267620, upcoming: false, name: "Starlink 4-16 (v1.5)", rocket: "23", success: true))
        
        launches.append(Launche(id: "2", flightNumber: 17, dateUTC: "2022-05-06T09:42:00.000Z", dateUnix: 1651830120, upcoming: false, name: "Starlink 4-17 (v1.5)", rocket: "201", success: false))
        
        launches.append(Launche(id: "3", flightNumber: 120, dateUTC: "2022-10-01T00:00:00.000Z", dateUnix: 1664582400, upcoming: true, name: "Crew-5", rocket: "34", success: nil))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(GenericResponseResult(isValid: true, object: GetLaunchesResult(launches: launches, hasNextPage: false, page: 1)))
        }
    }
}
