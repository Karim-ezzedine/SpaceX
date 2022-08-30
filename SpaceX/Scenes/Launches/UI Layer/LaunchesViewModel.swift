//
//  LaunchesViewModel.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import Foundation

class LaunchesViewModel {
    //MARK: - Private Object
    private var launchesModel: LaunchesModel
    
    //MARK: - Binding Object
    var showAlert: Box<Alert> = Box(.none)
    var showProgress: Box<Bool> = Box(false)
    var lauches: Box<Launches> = Box([])
    
    //MARK: - Geters
    var allowPagination: Bool { return launchesModel.allowPagination }
    
    //MARK: - Initializer
    init(launchesModel: LaunchesModel = LaunchesModel()) {
        self.launchesModel = launchesModel
        self.getLaunches()
    }
}

//MARK: - Data Fetching
extension LaunchesViewModel {
    
    // MARK: - Get Launches
    ////  Method Called in initializer
    ////  Function created to get the successful and  upcoming rocket launches for the last 3 years.
    
    func getLaunches() {
        
        if self.lauches.value.count == 0 {
            self.showProgress.value = true
        }
        
        self.launchesModel.setAllowPagination(allowPagination: false)
        
        launchesModel.launchesDataRequest.getLaunches(page: launchesModel.page) { [unowned self] result in
            
            self.showProgress.value = false
            
            if result.isValid {
                self.launchesModel.setPage(page: result.object.page + 1)
                self.launchesModel.setAllowPagination(allowPagination: result.object.hasNextPage)
                self.lauches.value.append(contentsOf: result.object.launches)
            }
            else {
                self.showAlert.value = Alert.custom(title: "", msg: result.message, btnText: "OK")
            }
        }
    }
}
