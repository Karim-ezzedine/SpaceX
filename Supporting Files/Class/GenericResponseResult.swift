//
//  GenericResponseResult.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 27/08/2022.
//

import Foundation

class GenericResponseResult<T> {
    var isValid: Bool
    var message: String
    var object: T
    
    init(isValid: Bool, message: String = "", object: T) {
        self.isValid = isValid
        self.message = message
        self.object = object
    }
}
