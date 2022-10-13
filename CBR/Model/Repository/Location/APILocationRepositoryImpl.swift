//
//  APILocationRepositoryImpl.swift
//  CBR
//
//  Created by Micah Meadows on 10/13/22.
//

import Foundation

class APILocationRepositoryImpl : LocationRepository {
    func getLocationDetails(location: Location) async -> LocationDetails {
        guard let url = URL(string: "\(CBR_API.base_address)/api/Location/\(location.id)/Details") else { fatalError("Missing URL"); }
        let urlRequest = URLRequest(url: url);
        let (data, response) = try! await URLSession.shared.data(for: urlRequest);
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching data");
        }
        let decodedMatch = try! JSONDecoder().decode(LocationDetails.self, from: data);
        
        return decodedMatch;
    }
}
