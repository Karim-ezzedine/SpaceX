//
//  RocketModel.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 30/08/2022.
//

import Foundation

class RocketModel {
    let id: String
    let rocketsDataRequest: RocketsDataRequestRepository
    
    init(id: String) {
        self.id = id
        self.rocketsDataRequest = IsTesting.rockets ? RocketsFakeDataRequest(): RocketsAPIDataRequest()
    }
}
