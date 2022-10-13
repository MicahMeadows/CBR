//
//  TestMatchRepositoryImpl.swift
//  CBR
//
//  Created by Micah Meadows on 10/4/22.
//

import Foundation

class TestMatchRepositoryImpl : MatchRepository {
    let names: [String] = ["Wallace", "Combs", "New Science", "REC Center", "Disney"];
    func submitMatch(result: MatchResult) async {
        try! await Task.sleep(nanoseconds: 500_000_000);
        print("submit match: \(result.winner.name) vs \(result.loser.name) and \(result.winner) won");
    }
    
    func getNewMatch() async -> Match {
        try! await Task.sleep(nanoseconds: 500_000_000);
        let redTeam: Location = Location(id: String(Int.random(in: 1...100)), name: names.randomElement() ?? "", imageUrl: "test", rating: Double.random(in: 1...25));
        let blueTeam: Location = Location(id: String(Int.random(in: 1...100)), name: names.randomElement() ?? "", imageUrl: "test", rating: Double.random(in: 1...25));
        let match: Match = Match(matchID: "1", redTeam: redTeam, blueTeam: blueTeam);
        return match;
    }
}
