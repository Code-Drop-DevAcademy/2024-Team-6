//
//  UserDefaultsManager.swift
//  CodeDrop
//
//  Created by 신승아 on 6/15/24.
//

import Foundation

extension UserDefaults {
    private enum Keys {
        static let name = "name"
        static let interested = "interested"
        static let likeFood = "likeFood"
    }
    
    var name: String? {
        get {
            return string(forKey: Keys.name)
        }
        set {
            set(newValue, forKey: Keys.name)
        }
    }
    
    var interested: [String]? {
        get {
            return array(forKey: Keys.interested) as? [String]
        }
        set {
            set(newValue, forKey: Keys.interested)
        }
    }
    
    var likeFood: [String]? {
        get {
            return array(forKey: Keys.likeFood) as? [String]
        }
        set {
            set(newValue, forKey: Keys.likeFood)
        }
    }
}
