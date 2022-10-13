//
//  MatchResult.swift
//  CBR
//
//  Created by Micah Meadows on 10/4/22.
//

import Foundation

struct MatchResult: Codable {
    let matchID: String;
    let winner: Location;
    let loser: Location;
    
    init(matchID: String, winner: Location, loser: Location) {
        self.matchID = matchID;
        self.winner = winner;
        self.loser = loser;
    }
}
