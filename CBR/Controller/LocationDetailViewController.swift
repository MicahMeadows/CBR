//
//  LocationDetailViewController.swift
//  CBR
//
//  Created by Micah Meadows on 10/13/22.
//

import UIKit

class LocationDetailViewController: UIViewController {
    
    @IBOutlet var bottomStack: UIStackView!;
    @IBOutlet var eloLbl: UILabel!;
    @IBOutlet var winLossLbl: UILabel!;
    @IBOutlet var winRateLbl: UILabel!;
    
    var rankedLocation: Ranking?;
    
    override func viewDidLoad() {
        bottomStack?.subviews.forEach { view in
            view.layer.cornerRadius = 15;
            view.layer.masksToBounds = true;
        };
        
        super.viewDidLoad()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
