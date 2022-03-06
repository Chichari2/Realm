//
//  weatherPersistanse.swift
//  Weather
//
//  Created by Артем Вологдин on 28.02.22.
//

import Foundation

class weatherPersistanse{
    
    static let shared = weatherPersistanse()
    
    private let kTemperatureKey = "Persistanse.kTemperatureKey"
    var temperature: String?{
        set {UserDefaults.standard.set(newValue,forKey: kTemperatureKey)}
        get {return UserDefaults.standard.string(forKey: kTemperatureKey)}
    }
}
