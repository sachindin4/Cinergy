//
//  APIService.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/17/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func getGuestToken(completion: @escaping (Result<GuestTokenModel, Error>) -> Void){
        let task = URLSession.shared.dataTask(with: APISetup.shared.guestTokenAPIRequest()) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Error", code: 1, userInfo: nil)))
                return
            }
            do {
                let decoder = JSONDecoder()
                let guestToken =  try decoder.decode(GuestTokenModel.self, from: data)
                completion(.success(guestToken))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func performLogin(completion: @escaping (Result<LoginModel, Error>) -> Void){
        let task = URLSession.shared.dataTask(with: APISetup.shared.loginRequest()) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Error", code: 1, userInfo: nil)))
                return
            }
            do {
                let decoder = JSONDecoder()
                let login =  try decoder.decode(LoginModel.self, from: data)
                completion(.success(login))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getMoviesList(userModel: LoginModel.UserModel, completion: @escaping (Result<HomeModel, Error>) -> Void){
        let task = URLSession.shared.dataTask(with: APISetup.shared.moviesListRequest(userModel: userModel)) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Error", code: 1, userInfo: nil)))
                return
            }
            do {
                let decoder = JSONDecoder()
                let login =  try decoder.decode(HomeModel.self, from: data)
                completion(.success(login))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getMovieInfo(movieId: String, userId: String, completion: @escaping (Result<BookingModel, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: APISetup.shared.movieInfoRequest(movieId: movieId, userId: userId)) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Error", code: 1, userInfo: nil)))
                return
            }            
            do {
                let decoder = JSONDecoder()
                let bookingInfo =  try decoder.decode(BookingModel.self, from: data)
                print(bookingInfo)
                completion(.success(bookingInfo))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
