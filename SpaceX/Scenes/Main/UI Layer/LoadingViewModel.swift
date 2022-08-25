//
//  LoadingViewModel.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import Foundation

class LoadingViewModel {
    
    //MARK: - Private Object
    private var loadingModel: LoadingModel
    
    //MARK: - Binding Object
    var constraint: Box<Double?> = Box(nil)
    var isAnimationCompleted: Box<Bool> = Box(false)
    
    //MARK: - Geters
    var animationTime: Double { return loadingModel.animationTime }
    
    //MARK: - Initializer
    init(loadingModel: LoadingModel = LoadingModel()) {
        self.loadingModel = loadingModel
        self.animateSplash()
    }
}


private extension LoadingViewModel {
    
    // MARK: - Animate Splash
    ////  Method Called in initializer
    ////  Function created to animate the logo in the splash screen
    
    func animateSplash() {
        
        let firstConstraintAnimationTime = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            self?.loadingModel.animationTime = firstConstraintAnimationTime
            self?.constraint.value = 80
        }
        
        let secondConstraintAnimationAwaitTime = firstConstraintAnimationTime
        let secondConstraintAnimationTime = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + secondConstraintAnimationAwaitTime) { [weak self] in
            self?.loadingModel.animationTime = secondConstraintAnimationTime
            self?.constraint.value = 35
            
            DispatchQueue.main.asyncAfter(deadline: .now() + secondConstraintAnimationTime, execute: { [weak self] in
                self?.isAnimationCompleted.value = true
            })
        }
    }
}
