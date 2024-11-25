//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by PT Phincon on 25/11/24.
//

import Foundation
struct WeatherModel: Codable {
    let main: MainWeather
    let weather: [Weather]
    let name: String
    
    struct MainWeather: Codable {
        let temp: Double
        let humidity: Int
        let temp_min: Double
        let temp_max: Double
    }
    
    struct Weather: Codable {
        let description: String
        let icon: String
    }
}
