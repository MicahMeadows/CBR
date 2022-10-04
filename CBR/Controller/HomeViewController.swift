//
//  ViewControllerP1.swift
//  CBR
//
//  Created by Micah Meadows on 9/27/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var containerView: UIView?;
    
    @IBAction func rankingButtonPressed(_ btn: UIButton) {
        print("ranking btn pressed");
        NotificationCenter.default.post(name: NSNotification.Name("navigate.rankings"), object: nil);
    }
    
    @IBAction func voteButtonPressed(_ btn: UIButton) {
        print("vote btn pressed");
        NotificationCenter.default.post(name: NSNotification.Name("navigate.vote"), object: nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
