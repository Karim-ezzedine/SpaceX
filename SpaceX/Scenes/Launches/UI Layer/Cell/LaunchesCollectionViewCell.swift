//
//  LaunchesCollectionViewCell.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 28/08/2022.
//

import UIKit

class LaunchesCollectionViewCell: UICollectionViewCell {

    //MARK: - @IBOutlet
    
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblLaunchingName: UILabel!
    @IBOutlet weak var upcomingIndicator: UIProgressView!
    @IBOutlet weak var viewIndicator: UIView!
    
    //MARK: - UICollectionViewCell Methods & Properties
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
        
        self.viewMain.clipsToBounds = true
        self.viewMain.layer.cornerRadius = 8
        self.viewIndicator.clipsToBounds = true
        self.viewIndicator.layer.cornerRadius = self.viewIndicator.frame.height/2
    }

    
    var data: Launche! {
        didSet {
            lblNumber.setLabelStyle(labelStyle: .visbyCFBold(text: data.flightNumberValue, fontSize: getExtraBoldLatoFont(size: 18)))
            
            lblDate.setLabelStyle(labelStyle: .visbyCFBold(text: data.launchingDate))
            
            lblLaunchingName.setLabelStyle(labelStyle: .custom(
                text: data.launchingName,
                textColor: .white,
                font: getBoldLatoFont(size: 14),
                numberOfLines: 2
            ))
            
            upcomingIndicator.isHidden = !data.isUpcoming
            upcomingIndicator.progress = 0.5
        }
    }
    
}
