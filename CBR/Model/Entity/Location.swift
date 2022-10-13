//
//  Location.swift
//  CBR
//
//  Created by Micah Meadows on 10/4/22.
//

import Foundation

struct Location: Codable {
    let id: String;
    let name: String;
    let description: String?;
    let imageUrl: String;
    let rating: Double;
    
    init(id: String, name: String, description: String? = nil, imageUrl: String, rating: Double) {
        self.id = id;
        self.name = name;
        self.description = description;
        self.imageUrl = imageUrl;
        self.rating = rating;
    }
}
