//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import UIKit

class LaunchesViewController: DefaultViewController {

    //MARK: - @IBOutlet
    
    
    //MARK: - Private Object
    
    private var launchesViwModel: LaunchesViewModel!
    
    
    //MARK: - UIViewController Methods & Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async { [unowned self] in
            self.launchesViwModel = LaunchesViewModel()
            self.binding()
        }
    }
    
    //MARK: - Private Standard Function
    
    private func binding() {
        launchesViwModel.showProgress.bind { [weak self] showProgress in
            self?.showProgress(show: showProgress)
        }
        
        launchesViwModel.showAlert.bind { [weak self] alert in
            switch alert {
            case .custom(let title, let msg, let btnText):
                appDelegate.showAlert(vc: self, titleTxt: title, msgTxt: msg, btnTxt: btnText)
            default:
                break
            }
        }
    }

}
