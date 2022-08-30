//
//  LaunchesAPIClient.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 27/08/2022.
//

import Foundation
import Alamofire

extension APIClient {
    
    static func getLaunches(param: Parameters, completion:@escaping (Result<GetLaunchesResult, AFError>)->Void) {
        
        let getRoute = getAPIData(
            baseURL: appDelegate.baseUrl,
            path: Webservice.launches.value,
            method: .post,
            parametersAndEncoding: [ParametersAndEncoding(parameters: param, encoding: JSONEncoding.default)],
            requestTitle: "GetLaunches"
        )
        
        performRequest(route: getRoute, completion: completion)
    }
}
