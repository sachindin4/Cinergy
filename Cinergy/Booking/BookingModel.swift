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

//getMovieInfo
/*
 {"response":"success","movie_info":{"show_times":[{"date":"2024-01-18","sessions":[{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"101904","ShowtimeVista":"2024-01-18T17:30:00","Showtime":"05:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"101905","ShowtimeVista":"2024-01-18T19:00:00","Showtime":"07:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":3,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"101906","ShowtimeVista":"2024-01-18T20:30:00","Showtime":"08:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":0,"ScreenNumber":11,"SoldoutStatus":1,"AllowTicketSales":true}]},{"date":"2024-01-19","sessions":[{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102147","ShowtimeVista":"2024-01-19T16:30:00","Showtime":"04:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102148","ShowtimeVista":"2024-01-19T18:00:00","Showtime":"06:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102149","ShowtimeVista":"2024-01-19T19:30:00","Showtime":"07:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102150","ShowtimeVista":"2024-01-19T21:00:00","Showtime":"09:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102151","ShowtimeVista":"2024-01-19T22:30:00","Showtime":"10:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true}]},{"date":"2024-01-20","sessions":[{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102178","ShowtimeVista":"2024-01-20T12:30:00","Showtime":"12:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102179","ShowtimeVista":"2024-01-20T14:00:00","Showtime":"02:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102180","ShowtimeVista":"2024-01-20T15:30:00","Showtime":"03:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102181","ShowtimeVista":"2024-01-20T17:00:00","Showtime":"05:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102182","ShowtimeVista":"2024-01-20T18:30:00","Showtime":"06:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102183","ShowtimeVista":"2024-01-20T20:00:00","Showtime":"08:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102184","ShowtimeVista":"2024-01-20T21:30:00","Showtime":"09:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102185","ShowtimeVista":"2024-01-20T23:00:00","Showtime":"11:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true}]},{"date":"2024-01-21","sessions":[{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102215","ShowtimeVista":"2024-01-21T12:30:00","Showtime":"12:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":6,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102216","ShowtimeVista":"2024-01-21T14:00:00","Showtime":"02:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102217","ShowtimeVista":"2024-01-21T15:30:00","Showtime":"03:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102218","ShowtimeVista":"2024-01-21T17:00:00","Showtime":"05:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102219","ShowtimeVista":"2024-01-21T18:30:00","Showtime":"06:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102220","ShowtimeVista":"2024-01-21T20:00:00","Showtime":"08:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true}]},{"date":"2024-01-22","sessions":[{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102240","ShowtimeVista":"2024-01-22T17:30:00","Showtime":"05:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102241","ShowtimeVista":"2024-01-22T19:00:00","Showtime":"07:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102242","ShowtimeVista":"2024-01-22T20:30:00","Showtime":"08:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true}]},{"date":"2024-01-23","sessions":[{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102256","ShowtimeVista":"2024-01-23T17:30:00","Showtime":"05:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102257","ShowtimeVista":"2024-01-23T19:00:00","Showtime":"07:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102258","ShowtimeVista":"2024-01-23T20:30:00","Showtime":"08:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true}]},{"date":"2024-01-24","sessions":[{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102272","ShowtimeVista":"2024-01-24T17:30:00","Showtime":"05:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102273","ShowtimeVista":"2024-01-24T19:00:00","Showtime":"07:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102274","ShowtimeVista":"2024-01-24T20:30:00","Showtime":"08:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true}]},{"date":"2024-01-25","sessions":[{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102288","ShowtimeVista":"2024-01-25T17:30:00","Showtime":"05:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102289","ShowtimeVista":"2024-01-25T19:00:00","Showtime":"07:00
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true},{"ScheduledFilmId":"HO00001620","Attribute":"SD","SessionId":"102290","ShowtimeVista":"2024-01-25T20:30:00","Showtime":"08:30
 PM","IsAllocatedSeating":false,"SeatsAvailable":8,"ScreenNumber":11,"SoldoutStatus":0,"AllowTicketSales":true}]}],"date_list":["2024-01-18","2024-01-19","2024-01-20","2024-01-21","2024-01-22","2024-01-23","2024-01-24","2024-01-25"]}}
 */
