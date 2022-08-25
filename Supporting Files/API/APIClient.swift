//
//  APIClient.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import Alamofire

class APIClient {
    @discardableResult
    public static func performRequest<T:Decodable>(route: APIRouteable, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Swift.Result<T, AFError>)->Void) -> DataRequest {
        return appDelegate.sessionManager
            .request(route)
            .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                
                var resultDataString = ""
                
                #if DEBUG
                print("APIClient statusCode \(route.requestTitle):",response.response?.statusCode ?? "nil")
                if response.data != nil {
                    let responseString = String(decoding: response.data!, as: UTF8.self)
                    print("APIClient responseString \(route.requestTitle):",responseString)
                    resultDataString = responseString
                }
                #else
                if appDelegate.enableApiDebugErrorIOS || isReleaseDebug() || appDelegate.enableApiLogIOS {
                    if response.data != nil {
                        resultDataString = String(decoding: response.data!, as: UTF8.self)
                    }
                }
                #endif
                
                completion(response.result)
            }
    }
}
