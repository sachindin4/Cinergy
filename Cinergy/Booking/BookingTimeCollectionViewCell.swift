//
//  BookingTimeCollectionViewCell.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/20/24.
//

import UIKit

class BookingTimeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let hexColor = 0xA1CE4A
        let red = CGFloat((hexColor & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hexColor & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hexColor & 0x0000FF) / 255.0
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        layer.borderWidth = 2.0
        layer.borderColor = color.cgColor
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
}
