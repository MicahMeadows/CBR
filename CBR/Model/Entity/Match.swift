//
//  Match.swift
//  CBR
//
//  Created by Micah Meadows on 10/4/22.
//

import Foundation

struct Match {
    let matchID: String;
    let redTeam: Location;
    let blueTeam: Location;
    
    init(matchID: String, redTeam: Location, blueTeam: Location) {
        self.matchID = matchID;
        self.redTeam = redTeam;
        self.blueTeam = blueTeam;
    }
}
