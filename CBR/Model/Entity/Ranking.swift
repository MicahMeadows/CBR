//
//  Ranking.swift
//  CBR
//
//  Created by Micah Meadows on 10/12/22.
//

import Foundation

struct Ranking: Codable {
    let rank: Int;
    let location: Location;
    
    init(rank: Int, location: Location) {
        self.rank = rank;
        self.location = location;
    }
}
