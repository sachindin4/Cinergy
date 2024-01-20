//
//  BookingViewModel.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/17/24.
//

import Foundation
import UIKit

class BookingViewModel {
    var movieInfo: HomeModel.MoviesList!
    var showTimeInfo : [BookingModel.MovieInfo.ShowTime]!
    var dateSelectedIndex: IndexPath?

    func dateFormatConverter(index: Int) -> (String, String) {
        var date = ""
        var day = ""
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        if let inputDate = inputFormatter.date(from: showTimeInfo[index].date) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd"
            date = dateFormatter.string(from: inputDate)
            
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "EEE"
            day = dayFormatter.string(from: inputDate)
        }
        return(date, day)
    }
    
    func getColor() -> UIColor {
        let hexColor = 0xd4dec3
        let red = CGFloat((hexColor & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hexColor & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hexColor & 0x0000FF) / 255.0
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }
}
