//
//  TokenManager.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/18/24.
//

import Foundation

class TokenManager {
    static let shared = TokenManager()
    
    private(set) var token: String?
    
    private init() {}
    
    func setToken(_ token: String){
        self.token = token
    }
}
