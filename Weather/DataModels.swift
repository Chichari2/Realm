//
//  DataModels.swift
//  Weather
//
//  Created by Артем Вологдин on 28.02.22.
//

import Foundation

struct Weather: Codable{
    var id: Int
    var main: String
    var description: String
}

struct Main: Codable{
    var temp:Double = 0.0
    var temp_min:Double = 0.0
    var temp_max:Double = 0.0
}


struct WeatherData: Codable{
    var weather: [Weather] = []
    var main: Main = Main()
    var name: String = " "
}
