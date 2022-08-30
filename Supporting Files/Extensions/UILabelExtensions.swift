//
//  UILabelExtensions.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 28/08/2022.
//

import UIKit

extension UILabel {
    
    func spaceBetweenCharacter(space: Double) {
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(space), range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }
    
    func spaceBetweenLine(space: Double) {
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = space
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
    
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
