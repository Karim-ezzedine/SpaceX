//
//  IsTesting.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 27/08/2022.
//

import Foundation

enum IsTesting {
    static let launches = appDelegate.isTesting && false
    static let rockets = appDelegate.isTesting && false
}
