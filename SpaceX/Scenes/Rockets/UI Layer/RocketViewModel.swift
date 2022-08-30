//
//  RocketViewModel.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 30/08/2022.
//

import Foundation

class RocketViewModel {
    //MARK: - Private Object
    private var rocketModel: RocketModel
    
    //MARK: - Binding Object
    var showAlert: Box<Alert> = Box(.none)
    var showProgress: Box<Bool> = Box(false)
    var rocket: Box<Rocket> = Box(Rocket())
    
    //MARK: - Geters
    
    //MARK: - Initializer
    init(id: String) {
        self.rocketModel = RocketModel(id: id)
        self.getRocket()
    }
}

//MARK: - Data Fetching
private extension RocketViewModel {
    
    func getRocket() {
        self.showProgress.value = true
        
        rocketModel.rocketsDataRequest.getRocket(id: rocketModel.id) { [unowned self] result in
            
            self.showProgress.value = false
            
            if result.isValid {
                self.rocket.value = result.object
            }
            else {
                self.showAlert.value = Alert.custom(title: "", msg: result.message, btnText: "OK")
            }
        }
    }
}
