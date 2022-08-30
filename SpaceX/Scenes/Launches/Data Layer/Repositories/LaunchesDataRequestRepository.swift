//
//  LaunchesDataRequestRepository.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 27/08/2022.
//

import Foundation

//MARK: - LaunchesDataRequestRepository
//// Protocol created to be able to inilize a Fake data request (For testing mode) Or  for remote API data request
//// Checkout the init() method in -> LaunchesModel

protocol LaunchesDataRequestRepository {
    func getLaunches(completion: @escaping (GenericResponseResult<Launches>) -> Void)
}

