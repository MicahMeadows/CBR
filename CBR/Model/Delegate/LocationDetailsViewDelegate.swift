//
//  LocationDetailsViewDelegate.swift
//  CBR
//
//  Created by Micah Meadows on 10/13/22.
//

import Foundation

protocol LocationDetailsViewDelegate {
    func onLoading();
    func onLoaded(locationDetails: LocationDetails);
}
