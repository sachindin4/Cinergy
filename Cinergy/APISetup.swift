//
//  APISetup.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/18/24.
//

import Foundation
import UIKit

typealias Parameters = [String: Any]
typealias Headers = [String: String]

class APISetup {
    
    static let shared = APISetup()
    
    fileprivate func commonHeaders() -> Headers {
        var headers = Headers()
        headers[Constants.APIKey.contentType] = Constants.APIConstant.contentType
        headers[Constants.APIKey.authorization] =  "Bearer \(TokenManager.shared.token ?? "")"
        return headers
    }
    
    fileprivate func commonParams() -> Parameters {
        let deviceUUID = UIDevice.current.identifierForVendor?.uuidString ?? ""
        print(deviceUUID)
        print("Hell world")
        var params = Parameters()
        params[Constants.APIKey.deviceType] = 2
        params[Constants.APIKey.deviceId] =  "CI-\(deviceUUID)"
        return params
    }
    
    func guestTokenAPIRequest() -> URLRequest {
        let url = URL(string: Constants.baseUrl + Constants.EndPoint.guestToken)!
        var request = URLRequest(url: url)
        request.httpMethod = Constants.APIConstant.postMethod
        request.addValue(Constants.APIConstant.contentType, forHTTPHeaderField: Constants.APIKey.contentType)
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: guestTokenParams())
        } catch {
            return request
        }
        return request
    }
    
    fileprivate func guestTokenParams() -> Parameters {
        var param = commonParams()
        param[Constants.APIKey.secretKey] = Constants.APIConstant.secretKey
        param[Constants.APIKey.pushToken] = ""
        return param
    }
    
    func loginRequest() -> URLRequest {
        let url = URL(string: Constants.baseUrl + Constants.EndPoint.login)!
        var request = URLRequest(url: url)
        request.httpMethod = Constants.APIConstant.postMethod
        request.allHTTPHeaderFields = commonHeaders()
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: loginParams())
        } catch {
            return request
        }
        return request
    }
    
    fileprivate func loginParams() -> Parameters {
        var param = commonParams()
        param[Constants.APIKey.loginType] = 2
        return param
    }
    
    func moviesListRequest(userModel: LoginModel.UserModel) -> URLRequest {
        let url = URL(string: Constants.baseUrl + Constants.EndPoint.escapeRoomMovies)!
        var request = URLRequest(url: url)
        request.httpMethod = Constants.APIConstant.postMethod
        request.allHTTPHeaderFields = commonHeaders()
        request.addValue(String(userModel.id), forHTTPHeaderField: Constants.APIKey.userID)
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: moviesListParams(memberId: String(userModel.memberId ?? 0)))
        } catch {
            return request
        }
        return request
    }
    
    fileprivate func moviesListParams(memberId: String) -> Parameters {
        var param = commonParams()
        param[Constants.APIKey.memberId] = memberId
        param[Constants.APIKey.locationId] = 5
        return param
    }
    
    func movieInfoRequest() -> URLRequest {
        let url = URL(string: Constants.baseUrl + Constants.EndPoint.escapeRoomMovies)!
        var request = URLRequest(url: url)
        request.httpMethod = Constants.APIConstant.postMethod
        request.allHTTPHeaderFields = commonHeaders()
        request.addValue("11", forHTTPHeaderField: Constants.APIKey.userID)
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: moviesInfoParams())
        } catch {
            return request
        }
        return request
    }
    
    fileprivate func moviesInfoParams() -> Parameters {
        var param = commonParams()
        param[Constants.APIKey.movieId] = "HO00001620"
        param[Constants.APIKey.locationId] = 5
        return param
    }
}
