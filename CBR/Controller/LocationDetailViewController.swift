//
//  LocationDetailViewController.swift
//  CBR
//
//  Created by Micah Meadows on 10/13/22.
//

import UIKit

class LocationDetailViewController: UIViewController, LocationDetailsViewDelegate {
    @IBOutlet var bottomStack: UIStackView!;
    @IBOutlet var eloLbl: UILabel!;
    @IBOutlet var winLossLbl: UILabel!
    @IBOutlet var winRateLbl: UILabel!;
    @IBOutlet var locationImage: UIImageView!;
    @IBOutlet var locationTitleLbl: UILabel!;
    @IBOutlet var locationDescription: UILabel!;
    @IBOutlet var mainView: UIView!;
    @IBOutlet var activityIndicator: UIActivityIndicatorView!;
    @IBOutlet var rankLabel: UILabel!;
    
    
    func onLoading() {
        DispatchQueue.main.async {
            self.mainView.subviews.forEach { view in
                view.isHidden = true;
            }
            self.activityIndicator.isHidden = false;
        }
        print("loading...");
    }
    
    func onLoaded(locationDetails: LocationDetails) {
        DispatchQueue.main.async {
            self.mainView.subviews.forEach { view in
                view.isHidden = false;
            }
            self.activityIndicator.isHidden = true;
        }
        DispatchQueue.main.async {
            self.eloLbl.text = String(Int(locationDetails.location.rating));
            self.locationTitleLbl.text = locationDetails.location.name;
            
            let winCnt = locationDetails.winCount;
            let lossCnt = locationDetails.matchCount - locationDetails.winCount;
            self.winLossLbl.text = "\(winCnt)-\(lossCnt)";
            
            let winPercent = Double(Double(winCnt) / Double(locationDetails.matchCount)) * 100.0;
            self.winRateLbl.text = "\(Int(winPercent))%";
            
            self.rankLabel.text = "Rank \(locationDetails.rank + 1)";
            
            let fixedDescription = locationDetails.location.description?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil) ?? "N/A";
            self.locationDescription.text = fixedDescription;
            
            let imageURL = URL(string: locationDetails.location.imageUrl)!;
            
            if let imageData = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: imageData) {
                    self.locationImage.image = image;
                }
            }
            
        }
    }
    
    var locationDetailsViewModel: LocationDetailsViewModel!;
    
    func setLocation(location: Location) {
        locationDetailsViewModel.loadDetails(location: location);
    }
    
    override func viewDidLoad() {
        let locationRepo = APILocationRepositoryImpl();
        locationDetailsViewModel = LocationDetailsViewModel(locationRepository: locationRepo, locationViewDelegate: self);
        bottomStack?.subviews.forEach { view in
            view.layer.cornerRadius = 15;
            view.layer.masksToBounds = true;
        };
        
        super.viewDidLoad()
    }
    
}
