//
//  LocationDetails.swift
//  CBR
//
//  Created by Micah Meadows on 10/13/22.
//

import Foundation

struct LocationDetails: Codable {
    let location: Location;
    let rank: Int;
    let matchCount: Int;
    let winCount: Int;
}
