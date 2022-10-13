//
//  APIMatchRepositoryImpl.swift
//  CBR
//
//  Created by Micah Meadows on 10/6/22.
//

import Foundation

class APIMatchRepositoryImpl : MatchRepository {
    let baseUrl = "https://8d9e-199-168-73-143.ngrok.io";
    
    func submitMatch(result: MatchResult) async {
        guard let url = URL(string: "\(baseUrl)/api/Match") else { fatalError("Missing URL"); };
        
        let jsonData = try! JSONEncoder().encode(result);
        
        var urlRequest = URLRequest(url: url);
        urlRequest.httpMethod = "POST";
        urlRequest.httpBody = jsonData;
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (_, response) = try! await URLSession.shared.data(for: urlRequest);
        
        if let statusCode = (response as? HTTPURLResponse)?.statusCode {
            print("status code: \(statusCode)");
        }
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error posting match");
        }
        
    }
    
    func getNewMatch() async -> Match {
        guard let url = URL(string: "\(baseUrl)/api/Match") else { fatalError("Missing URL"); }
        let urlRequest = URLRequest(url: url);
        let (data, response) = try! await URLSession.shared.data(for: urlRequest);
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching data");
        }
        let decodedMatch = try! JSONDecoder().decode(Match.self, from: data);
        
        return decodedMatch;
    }
}
