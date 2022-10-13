//
//  LocationDetailsViewModel.swift
//  CBR
//
//  Created by Micah Meadows on 10/13/22.
//

import Foundation

class LocationDetailsViewModel {
    let locationRepository: LocationRepository;
    let locationViewDelegate: LocationDetailsViewDelegate;
    
    init(locationRepository: LocationRepository, locationViewDelegate: LocationDetailsViewDelegate) {
        self.locationRepository = locationRepository;
        self.locationViewDelegate = locationViewDelegate;
    }
    
    func loadDetails(location: Location) {
        Task {
            locationViewDelegate.onLoading();
            let newLoadedDetails = await locationRepository.getLocationDetails(location: location);
            locationViewDelegate.onLoaded(locationDetails: newLoadedDetails);
        }
    }
}
