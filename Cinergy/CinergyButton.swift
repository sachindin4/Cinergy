//
//  CinergyButton.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/17/24.
//

import UIKit

@IBDesignable

class CinergyButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var initialColor: UIColor = UIColor.red {
        didSet {
            updateColor()
        }
    }
    
    @IBInspectable var finalColor: UIColor = UIColor.blue {
        didSet {
            updateColor()
        }
    }
    
    let gradientLayer = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        gradientLayer.frame = rect
        
        gradientLayer.colors = [initialColor.cgColor, finalColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    func updateColor() {
        gradientLayer.colors = [initialColor.cgColor, finalColor.cgColor]
    }
}
