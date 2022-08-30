//
//  RocketsDataRequestRepository.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 30/08/2022.
//

import Foundation

//MARK: - RocketsDataRequestRepository
//// Protocol created to be able to inilize a Fake data request (For testing mode) Or  for remote API data request
//// Checkout the init() method in -> RocketModel

protocol RocketsDataRequestRepository {
    func getRocket(id: String, completion: @escaping (GenericResponseResult<Rocket>) -> Void)
}
