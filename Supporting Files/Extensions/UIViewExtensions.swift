//
//  UIViewExtensions.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 29/08/2022.
//

import UIKit

// MARK: - UIView Extensions

extension UIView {
    
    func addVetricalGradient(topColor: UIColor = .white, bottomColor: UIColor = .black, opacity: Float = 1) {
        let gradient = CAGradientLayer()
        
        gradient.startPoint = CGPoint(x : 0.0, y : 0)
        gradient.endPoint = CGPoint(x :0.2, y: 0.8)
        gradient.frame = self.bounds
        
        gradient.colors = [topColor.cgColor,  bottomColor.cgColor]
        gradient.opacity = opacity
        
        self.layer.addSublayer(gradient)
    }
    
    func setViewStyle(viewStyle: ViewStyle) {
        switch viewStyle {
        case .custom(let color, let cornerRadius, let borderColor, let borderWidth):
            self.backgroundColor = color ?? self.backgroundColor
            self.clipsToBounds = true
            self.layer.borderWidth = borderWidth ?? self.layer.borderWidth
            self.layer.borderColor = borderColor?.cgColor ?? self.layer.borderColor
            self.layer.cornerRadius = cornerRadius ?? self.layer.cornerRadius
        }
    }
}
