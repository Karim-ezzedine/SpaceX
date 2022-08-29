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
    
    
    //MARK: - UICollectionViewCell Methods & Properties
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
        
        self.viewMain.clipsToBounds = true
        self.viewMain.layer.cornerRadius = 8
    }

    
    var data: Launche! {
        didSet {
            lblNumber.setLabelStyle(labelStyle: .visbyCFBold(text: data.flightNumberValue, fontSize: getExtraBoldLatoFont(size: 18)))
            
            lblDate.setLabelStyle(labelStyle: .visbyCFBold(text: data.launchingDate))
        }
    }
    
}
