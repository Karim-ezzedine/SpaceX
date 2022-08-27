//
//  Alert.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 27/08/2022.
//

import Foundation

enum Alert {
    case none
    case normal(show: Bool = false, title: String = "", msg: String = "")
    case internet
    case toast(msg: String = "")
    case update(isForceUpdate: Bool)
    case custom(title: String, msg: String, btnText: String)
    case close
}
