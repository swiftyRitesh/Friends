//
//  Friends.swift
//  Friends
//
//  Created by Ritesh Sathiyamoorthi on 26/6/21.
//

import Foundation

struct Friend: Identifiable {
    
    var id = UUID()
    
    
    var name: String
    var icon: String
    var school: String
    
    var slothImage: String
    var link: URL
    
    var attack: Double
    var defence: Double
    
    var type: [FriendType]
}
