//
//  Mission.swift
//  MoonShot
//
//  Created by William on 5/5/23.
//

import Foundation

struct Mission: Codable, Identifiable{
    
    struct CrewRole: Codable{
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date? // Was String? before we decoded our dates
    let crew: [CrewRole]
    let description: String
    
    var displayName: String{
        "Apollo \(id)"
    }
    
    var image: String{
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String{
        // We convert our Date back to a string
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
}
