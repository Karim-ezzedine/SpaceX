//
//  UIButtonExtensions.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 30/08/2022.
//

import UIKit

extension UIButton {
    
    func setButtonStyle(buttonStyle: ButtonStyle) {
        switch buttonStyle {
        case .primaryButton(let text, let textColor, let font, let backgroundColor, let cornerRadius):
            self.setTitle(text, for: .normal)
            self.setTitleColor(textColor, for: .normal)
            self.titleLabel?.font = font
            self.backgroundColor = backgroundColor
            self.clipsToBounds = true
            self.layer.cornerRadius = cornerRadius
        case .custom(let text, let backgroundColor, let cornerRadius, let borderColor, let borderWidth):
            self.setTitle(text, for: .normal)
            self.backgroundColor = backgroundColor
            self.clipsToBounds = true
            self.layer.borderColor = borderColor?.cgColor ?? self.layer.borderColor
            self.layer.borderWidth = borderWidth ?? self.layer.borderWidth
            self.layer.cornerRadius = cornerRadius ?? self.layer.cornerRadius
        }
    }
}
