//
//  UIStyle.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 28/08/2022.
//

import UIKit

enum LabeleStyle {
    case title(text: String? = nil, textColor: UIColor = AppColors.primaryTextColor, fontSize: UIFont = getBoldLatoFont(size: 24))
    case visbyCFBold(text: String? = nil, textColor: UIColor = .white, fontSize: UIFont = getBoldLatoFont(size: 12))
    case custom(text: String? = nil, textColor: UIColor? = nil, font: UIFont? = nil, numberOfLines: Int = 1)
}
