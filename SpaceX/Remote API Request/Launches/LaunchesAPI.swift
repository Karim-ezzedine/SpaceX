//
//  LaunchesAPI.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 26/08/2022.
//

import Foundation
import Alamofire

class LaunchesAPI {
 
    func getLaunches(completion: @escaping (Swift.Result<Launches, AFError>) -> Void) {
        
        var queryParams: [String : Any] = [:]
        
        if let date = Calendar.current.date(byAdding: .year, value: -3, to: Date()) {
            let formatedDate = appDelegate.dataDateFormat.string(from: date)
            
            queryParams = [
                "date_utc": [
                    "$gte": formatedDate
                ]
            ]
        }
    
        let optionsParams: [String : Any] = [
            "pagination": false,
            "select": ["name", "flight_number", "date_utc", "date_unix", "upcoming", "rocket", "success"]
        ]
        
        let parameters: Parameters = [
            "query": queryParams,
            "options": optionsParams
        ]
        
        APIClient.getLaunches(param: parameters) { result in
            switch result {
            case .success(let data):
                completion(.success(data.launches))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
