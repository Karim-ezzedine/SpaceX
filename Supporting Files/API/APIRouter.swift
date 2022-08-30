//
//  APIRouter.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import Foundation
import Alamofire

protocol APIRouteable : URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parametersAndEncoding: [ParametersAndEncoding] { get }
    var headers: HTTPHeaders { get }
    var requestTitle: String { get }
}

struct ParametersAndEncoding {
    var parameters: Parameters?
    var encoding: ParameterEncoding
}

extension APIRouteable {

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let baseURL = try baseURL.asURL()
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(self.path))

        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        #if DEBUG
        print("APIRoute url \(requestTitle): \(baseURL)\(self.path)")
        #endif
        
        try parametersAndEncoding.forEach({ item in
            if let param = item.parameters {
                
                do {
                    urlRequest = try item.encoding.encode(urlRequest, with: param)
                }
                catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
                
                #if DEBUG
                print("APIRoute parameterss \(requestTitle): \(param)")
                #endif
            }
            else {
                #if DEBUG
                print("APIRoute parameters \(requestTitle): \(item.parameters ?? ["nil":"-"])")
                #endif
            }
        })

        return urlRequest
    }
}

struct getAPIData: APIRouteable {
    var baseURL: String
    var path: String
    var method: HTTPMethod
    var parametersAndEncoding: [ParametersAndEncoding]
    var headers: HTTPHeaders = [:]
    var requestTitle: String
}
