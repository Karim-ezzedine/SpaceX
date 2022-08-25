//
//  APIPath.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import Foundation

class APIPath : Codable {
    var key: String
    var value: String
    
    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}
