//
//  BookingModel.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/17/24.
//

import Foundation

struct BookingModel: Codable {
    let response: String
    let movieInfo: MovieInfo
    
    struct MovieInfo: Codable {
        let showTimes: [ShowTime]
        
        struct ShowTime: Codable {
            let date: String
            let sessions: [SessionInfo]
            
            struct SessionInfo: Codable {
                let showTime: String
                
                enum CodingKeys: String, CodingKey {
                    case showTime = "Showtime"
                }
            }
            
            enum CodingKeys: String, CodingKey {
                case date
                case sessions
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case showTimes = "show_times"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case response
        case movieInfo = "movie_info"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        response = try container.decode(String.self, forKey: .response)
        movieInfo = try container.decode(MovieInfo.self, forKey: .movieInfo)
    }
}
