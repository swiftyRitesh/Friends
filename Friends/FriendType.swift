//
//  FriendType.swift
//  Friends
//
//  Created by Ritesh Sathiyamoorthi on 3/7/21.
//

import Foundation


enum FriendType: String {
    case normal = "normal"
    case fire = "fire"
    case water = "water"
    case grass = "grass"
    case electric = "electric"
    case ice = "ice"
    
    func getSymbolName() -> String {
        switch self {
        case .normal:
            return "face.smiling"
        case .fire:
            return "flame"
        case .water:
            return "drop"
        case .grass:
            return "leaf"
        case .electric:
            return "bolt"
        case .ice:
            return "snow"
        }
    }
    
}
