//
//  APIRankingRepositoryImpl.swift
//  CBR
//
//  Created by Micah Meadows on 10/12/22.
//

import Foundation

class APIRankingsRepositoryImpl : RankingsRepository {
    func getRankings() async -> [Ranking] {
        guard let url = URL(string: "\(CBR_API.base_address)/api/Ranking") else { fatalError("Missing URL"); }
        let urlRequest = URLRequest(url: url);
        let (data, response) = try! await URLSession.shared.data(for: urlRequest);
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching data");
        }
        let decodedRankings = try! JSONDecoder().decode([Ranking].self, from: data);
        
        return decodedRankings;
    }
}
