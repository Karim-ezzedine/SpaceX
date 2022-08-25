//
//  LoadingViewController.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import UIKit

class LoadingViewController: DefaultViewController {
    
    //MARK: - @IBOutlet
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var trailingLogoConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingLogoConstraint: NSLayoutConstraint!
    
    
    //MARK: - Private Object
    
    private var loadingViewModel = LoadingViewModel()
    
    
    //MARK: - UIViewController Methods & Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async { [weak self] in
            self?.binding()
        }
    }
    
    
    //MARK: - Private Standard Function
    
    private func binding() {
        
        loadingViewModel.constraint.bind { [unowned self] constraint in
            if constraint != nil {
                self.leadingLogoConstraint.constant = constraint!
                self.trailingLogoConstraint.constant = constraint!
                
                UIView.animate(withDuration: self.loadingViewModel.animationTime, animations: { [weak self] in
                    self?.view.layoutIfNeeded()
                })
            }
        }
        
        loadingViewModel.isAnimationCompleted.bind { [weak self] isAnimationCompleted in
            if isAnimationCompleted {
                self?.reloadApp(storyBorad: Storyboard.launches, viewControllerID: ViewControllerID.launchesViewID)
            }
        }
    }
}
