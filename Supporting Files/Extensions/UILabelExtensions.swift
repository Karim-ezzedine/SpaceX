//
//  UILabelExtensions.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 28/08/2022.
//

import UIKit

extension UILabel {
    func setLabelStyle(labelStyle: LabeleStyle) {
        switch labelStyle {
        case .title(let text, let textColor, let font):
            self.text = text ?? self.text
            self.textColor = textColor
            self.font = font
        case .visbyCFBold(let text, let textColor, let font):
            self.text = text ?? self.text
            self.textColor = textColor
            self.font = font
        case .custom(let text, let textColor, let font, let numberOfLines):
            self.text = text ?? self.text
            self.textColor = textColor ?? self.textColor
            self.font = font != nil ? font : self.font
            self.numberOfLines = numberOfLines
        }
    }
}
