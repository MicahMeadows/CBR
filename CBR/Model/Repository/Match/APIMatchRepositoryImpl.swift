//
//  APIMatchRepositoryImpl.swift
//  CBR
//
//  Created by Micah Meadows on 10/6/22.
//

import Foundation

class APIMatchRepositoryImpl : MatchRepository {
    func submitMatch(result: MatchResult) async {
        guard let url = URL(string: "\(CBR_API.base_address)/api/Match") else { fatalError("Missing URL"); };
        
        let jsonData = try! JSONEncoder().encode(result);
        
        var urlRequest = URLRequest(url: url);
        urlRequest.httpMethod = "POST";
        urlRequest.httpBody = jsonData;
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        try! await URLSession.shared.data(for: urlRequest);
    }
    
    func getNewMatch() async -> Match {
        guard let url = URL(string: "\(CBR_API.base_address)/api/Match") else { fatalError("Missing URL"); }
        var urlRequest = URLRequest(url: url);
        urlRequest.httpMethod = "GET";
        let (data, response) = try! await URLSession.shared.data(for: urlRequest);
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching data");
        }
        let decodedMatch = try! JSONDecoder().decode(Match.self, from: data);
        
        return decodedMatch;
    }
}
