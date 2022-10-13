//
//  TestRankingsRepositoryImpl.swift
//  CBR
//
//  Created by Micah Meadows on 10/12/22.
//

import Foundation

class TestRankingsRepositoryImpl : RankingsRepository {
    
    let rankings: [Ranking] = [
        Ranking(rank: 1, location: Location(id: "0", name: "Test l 1", imageUrl: "", rating:2)),
        Ranking(rank: 2, location: Location(id: "1", name: "Test l 2", imageUrl: "", rating:3)),
        Ranking(rank: 3, location: Location(id: "2", name: "Test l 3", imageUrl: "", rating:4))
    ];
    
    func getRankings() async -> [Ranking] {
        Task {}
        return rankings;
    }
}
