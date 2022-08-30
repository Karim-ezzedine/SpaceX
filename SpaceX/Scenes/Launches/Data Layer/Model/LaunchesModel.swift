//
//  LaunchesModel.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 27/08/2022.
//

import Foundation

class LaunchesModel {
    let launchesDataRequest: LaunchesDataRequestRepository
    
    private(set) var allowPagination: Bool
    private(set) var page: Int
    
    init(allowPagination: Bool = false, page: Int = 1) {
        self.launchesDataRequest = IsTesting.launches ? LaunchesFakeDataRequest(): LaunchesAPIDataRequest()
        self.allowPagination = allowPagination
        self.page = page
    }
    
    func setAllowPagination(allowPagination: Bool) {
        self.allowPagination = allowPagination
    }
    
    func setPage(page: Int) {
        self.page = page
    }
}
