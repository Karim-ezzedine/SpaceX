//
//  DefaultViewController.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import UIKit
import KRProgressHUD

class DefaultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation Methods
    
    func reloadApp(storyBorad: UIStoryboard, viewControllerID: String, animationOption: UIView.AnimationOptions = .transitionCrossDissolve) {
        let rootviewcontroller: UIWindow = self.view.window!
        rootviewcontroller.rootViewController = storyBorad.instantiateViewController(withIdentifier: viewControllerID)
        UIView.transition(with: rootviewcontroller, duration: 0.6, options: animationOption, animations: nil)
    }
    
    @objc func closePage(){
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
