//
//  RocketsAPIClient.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 30/08/2022.
//

import Foundation

import Alamofire

extension APIClient {
    
    static func getRockets(param: Parameters, completion:@escaping (Result<GetRocketsResult, AFError>)->Void) {
        
        let getRoute = getAPIData(
            baseURL: appDelegate.baseUrl,
            path: Webservice.rockets.value,
            method: .post,
            parametersAndEncoding: [ParametersAndEncoding(parameters: param, encoding: JSONEncoding.default)],
            requestTitle: "GetRockets"
        )
        
        performRequest(route: getRoute, completion: completion)
    }
}
