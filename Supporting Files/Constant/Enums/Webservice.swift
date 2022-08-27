//
//  Webservice.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import Foundation

enum Webservice {
    static let launches = APIPath(key: "01", value: "launches/query")
    static let rockets = APIPath(key: "02", value: "rockets")
}
