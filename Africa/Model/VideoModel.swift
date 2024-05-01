//
//  VideoModel.swift
//  Africa
//
//  Created by Denis Yaremenko on 29.03.2024.
//

import Foundation


struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
    
}
