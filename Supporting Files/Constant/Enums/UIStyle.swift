//
//  UIStyle.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 28/08/2022.
//

import UIKit

enum ViewStyle {
    case custom(color: UIColor? = nil, cornerRadius: CGFloat? = nil, borderColor: UIColor? = nil, borderWidth: CGFloat? = nil)
}


enum LabeleStyle {
    case title(text: String? = nil, textColor: UIColor = AppColors.primaryTextColor, fontSize: UIFont = getBoldLatoFont(size: 24))
    case visbyCFBold(text: String? = nil, textColor: UIColor = .white, fontSize: UIFont = getBoldLatoFont(size: 12))
    case custom(text: String? = nil, textColor: UIColor? = nil, font: UIFont? = nil, numberOfLines: Int = 1)
}

enum ButtonStyle {
    case primaryButton(text: String = "", textColor: UIColor = .white, font: UIFont = getLatoFont(size: 18), backgroundColor: UIColor = AppColors.darkBlue, cornerRadius: CGFloat = 6)
    case custom(text: String = "", backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil, borderColor: UIColor? = nil, borderWidth: CGFloat? = nil)
}
