//
//  RetaurantEntitty.swift
//  TheFork
//
//  Created by Oscar on 5/03/22.
//

import Foundation
import CoreLocation

// MARK: - RetaurantEntitty
struct RetaurantEntitty: Codable {
    let id: Int
    let name: String
    let gpsLat, gpsLong: Double
    let address, city, zipcode, currencyCode: String
    let cardPrice, tripadvisorAvgRate, tripadvisorRateCount: Int
    let avgRate: Double
    let rateCount: Int
    let speciality: String
    let url: String
    let picsDiaporama: [String]

    var location: CLLocation {
        CLLocation(latitude: gpsLat, longitude: gpsLong)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case gpsLat = "gps_lat"
        case gpsLong = "gps_long"
        case address, city, zipcode
        case currencyCode = "currency_code"
        case cardPrice = "card_price"
        case tripadvisorAvgRate = "tripadvisor_avg_rate"
        case tripadvisorRateCount = "tripadvisor_rate_count"
        case avgRate = "avg_rate"
        case rateCount = "rate_count"
        case speciality, url
        case picsDiaporama = "pics_diaporama"
    }
}

