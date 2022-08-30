//
//  Storyboard.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import UIKit

enum Storyboard {
    static let main = UIStoryboard(name: "Main", bundle: nil)
    static let launches = UIStoryboard(name: "Launches", bundle: nil)
    static let rockets = UIStoryboard(name: "Rockets", bundle: nil)
}

enum ViewControllerID {
    static let launchesViewID = "LaunchesViewID"
    static let rocketsViewID = "RocketsViewID"
}
