//
//  Persistanse.swift
//  Weather
//
//  Created by Артем Вологдин on 28.02.22.
//

import Foundation

class Persistanse{
    
    static let shared = Persistanse()
    
    private let kUserNameKey = "Persistanse.kUserNameKey"
    var userName: String?{
        set {UserDefaults.standard.set(newValue,forKey: kUserNameKey)}
        get {return UserDefaults.standard.string(forKey: kUserNameKey)}
    }
        
        private let kUserSurnameKey = "Persistanse.kUserSurnameKey"
        var userSurname: String?{
            set {UserDefaults.standard.set(newValue,forKey: kUserSurnameKey)}
            get {return UserDefaults.standard.string(forKey: kUserSurnameKey)}
    }
}
