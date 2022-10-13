//
//  LocationRepository.swift
//  CBR
//
//  Created by Micah Meadows on 10/13/22.
//

import Foundation

protocol LocationRepository {
    func getLocationDetails(location: Location) async -> LocationDetails;
}
