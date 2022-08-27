//
//  LaunchesModel.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 27/08/2022.
//

import Foundation

class LaunchesModel {
    let launchesDataRequest: LaunchesDataRequestRepository
    
    init() {
        launchesDataRequest = IsTesting.launches ? LaunchesFakeDataRequest(): LaunchesAPIDataRequest()
    }
}
