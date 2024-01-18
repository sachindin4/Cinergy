//
//  Constants.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/17/24.
//

import Foundation

struct Constants {
    static let baseUrl: String = "https://cinergyapp.thetunagroup.com/api/"
    
    struct EndPoint {
        static let guestToken = "guestToken"
        static let login = "login"
        static let escapeRoomMovies = "escapeRoomMovies"
        static let getMovieInfo = "getMovieInfo"
    }
    
    struct APIKey {
        //Parameters
        static let secretKey = "secret_key"
        static let deviceType = "device_type"
        static let deviceId = "device_id"
        static let pushToken = "push_token"
        static let loginType = "login_type"
        static let memberId = "member_id"
        static let locationId = "location_id"
        static let movieId = "movie_id"
        //Headers
        static let contentType = "Content-Type"
        static let authorization = "Authorization"
        static let userID = "userid"
    }
    
    struct APIConstant {
        static let contentType = "application/json"
        static let secretKey = "402620C92552D9303C58B901B43B0A41718E772C19520DD9A9AA52CE5A8FCB99"
        static let postMethod = "POST"
    }
}


