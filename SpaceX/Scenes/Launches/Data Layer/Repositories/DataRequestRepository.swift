//
//  DataRequestRepository.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 27/08/2022.
//

import Foundation

protocol LaunchesDataRequestRepository {
    func getLaunches(completion: @escaping (GenericResponseResult<Launches>) -> Void)
}

