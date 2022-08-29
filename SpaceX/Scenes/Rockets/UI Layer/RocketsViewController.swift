//
//  RocketsViewController.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 30/08/2022.
//

import UIKit

class RocketsViewController: DefaultViewController {

    //MARK: - @IBOutlet
    @IBOutlet weak var topGradient: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var btnClose: UIButton!
    
    @IBOutlet weak var lblRocketName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnReadMore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async { [unowned self] in
//            self.launchesViwModel = LaunchesViewModel()
            self.setStyle()
            self.linkMethods()
            self.binding()
        }
    }

    
    //MARK: - Private Standard Function
    
    private func setStyle() {
        self.bottomView.roundTop(radius: 30)
        
        lblRocketName.setLabelStyle(labelStyle: .title(fontSize: getBoldLatoFont(size: 20)))
        
        lblDescription.setLabelStyle(labelStyle: .custom(textColor: AppColors.secondaryTextColor, font: getLatoFont(size: 16), numberOfLines: 0))
        lblDescription.spaceBetweenLine(space: 6)
        
        btnReadMore.setButtonStyle(buttonStyle: .primaryButton(text: "Read More"))
    }
    
    private func linkMethods() {
        btnClose.addTarget(self, action: #selector(self.closePage), for: .touchUpInside)
    }
    
    private func binding() {
        
    }
}
