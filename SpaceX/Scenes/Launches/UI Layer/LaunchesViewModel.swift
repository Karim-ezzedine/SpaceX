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
    
    //MARK: - Initializer
    init(launchesModel: LaunchesModel = LaunchesModel()) {
        self.launchesModel = launchesModel
        self.getLaunches()
    }
}

//MARK: - Data Fetching
private extension LaunchesViewModel {
    
    // MARK: - Get Launches
    ////  Method Called in initializer
    ////  Function created to get the successful and  upcoming rocket launches for the last 3 years.
    
    func getLaunches() {
        self.showProgress.value = true
        
        launchesModel.launchesDataRequest.getLaunches { [unowned self] result in
            
            self.showProgress.value = false
            
            if result.isValid {
                self.lauches.value = result.object
            }
            else {
                self.showAlert.value = Alert.custom(title: "", msg: result.message, btnText: "OK")
            }
        }
    }
}
