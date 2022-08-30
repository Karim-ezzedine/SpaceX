//
//  LaunchesAPI.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 26/08/2022.
//

import Foundation
import Alamofire

class LaunchesAPI {
 
    func getLaunches(page: Int, completion: @escaping (Swift.Result<GetLaunchesResult, AFError>) -> Void) {
        
        var queryParams: [String : Any] = [:]
        
        if let date = Calendar.current.date(byAdding: .year, value: -3, to: Date()) {
            queryParams = [
                "date_unix": [
                    "$gte": Int(date.timeIntervalSince1970)
                ]
            ]
        }
    
        let optionsParams: [String : Any] = [
            "pagination": true,
            "limit": 20,
            "page": page,
            "select": ["name", "flight_number", "date_utc", "date_unix", "upcoming", "rocket", "success"],
            "sort": [
                "date_unix": "desc"
            ]
        ]
        
        let parameters: Parameters = [
            "query": queryParams,
            "options": optionsParams
        ]
        
        APIClient.getLaunches(param: parameters) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
