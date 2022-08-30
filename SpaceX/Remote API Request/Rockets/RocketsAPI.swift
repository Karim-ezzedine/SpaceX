//
//  RocketsAPI.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 30/08/2022.
//

import Foundation
import Alamofire

class RocketsAPI {
    
    func getRockets(id: String, completion: @escaping (Swift.Result<Rockets, AFError>) -> Void) {
        
        let queryParams: [String : Any] = [
            "_id": id
        ]
    
        let optionsParams: [String : Any] = [
            "pagination": false,
            "limit": 1,
            "select": ["name", "description", "wikipedia", "flickr_images"],
        ]
        
        let parameters: Parameters = [
            "query": queryParams,
            "options": optionsParams
        ]
        
        APIClient.getRockets(param: parameters) { result in
            switch result {
            case .success(let data):
                completion(.success(data.rockets))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
