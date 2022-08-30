//
//  RocketsViewController.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 30/08/2022.
//

import UIKit
import AlamofireImage

class RocketsViewController: DefaultViewController {

    //MARK: - @IBOutlet
    @IBOutlet weak var topGradient: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var btnClose: UIButton!
    
    @IBOutlet weak var lblRocketName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnReadMore: UIButton!
    
    //MARK: - Object
    
    var rocketViwModel: RocketViewModel!
    
    
    //MARK: - UIViewController Methods & Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async { [unowned self] in
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
        btnReadMore.addTarget(self, action: #selector(self.openWikipediaLink), for: .touchUpInside)
    }
    
    private func binding() {
        rocketViwModel.showProgress.bind { [weak self] showProgress in
            self?.showProgress(show: showProgress)
        }
        
        rocketViwModel.showAlert.bind { [weak self] alert in
            switch alert {
            case .custom(let title, let msg, let btnText):
                appDelegate.showAlert(vc: self, titleTxt: title, msgTxt: msg, btnTxt: btnText)
            default:
                break
            }
        }
        
        rocketViwModel.rocket.bind { [weak self] rocket in
            self?.lblRocketName.text = rocket.rocketName
            self?.lblDescription.text = rocket.rocketDescription
            
            let escapedString = (rocket.imagePath).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
            if let url = URL(string: escapedString!){
                print("image Path url : ", url)
                
                UIImageView().af.setImage(withURL: url , completion: { [weak self] response in
                    if(response.value != nil){
                        self?.topImageView.image = response.value!
                    }
                    else {
                        self?.topImageView.image = UIImage(named: "rocketBackground")!
                    }
                })
            }
        }
    }
    
    //MARK: - Private Action Function
    
    @objc func openWikipediaLink() {
        if let url = URL(string: rocketViwModel.rocket.value.wikipediaLink) {
            UIApplication.shared.open(url)
        }
    }
}
