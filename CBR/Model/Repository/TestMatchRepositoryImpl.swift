//
//  TestMatchRepositoryImpl.swift
//  CBR
//
//  Created by Micah Meadows on 10/4/22.
//

import Foundation

class TestMatchRepositoryImpl : MatchRepository {
    func submitMatch(result: MatchResult) {
        print("submit match: \(result.winner.name) vs \(result.loser.name) and \(result.winner) won");
    }
    
    func getNewMatch() -> Match {
        let redTeam: Location = Location(id: String(Int.random(in: 1...100)), name: "Wallace", imageUrl: "test", rating: Double.random(in: 1...25));
        let blueTeam: Location = Location(id: String(Int.random(in: 1...100)), name: "Combs", imageUrl: "test", rating: Double.random(in: 1...25));
        let match: Match = Match(matchID: "1", redTeam: redTeam, blueTeam: blueTeam);
        return match;
    }
}
