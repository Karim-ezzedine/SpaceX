//
//  RocketsDataRequestRepository.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 30/08/2022.
//

import Foundation

protocol RocketsDataRequestRepository {
    func getRocket(id: String, completion: @escaping (GenericResponseResult<Rocket>) -> Void)
}
