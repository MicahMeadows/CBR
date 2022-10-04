//
//  RankingsViewController.swift
//  CBR
//
//  Created by Micah Meadows on 10/4/22.
//

import UIKit

class RankingsViewController: UIViewController {
    
    @IBOutlet var topVote: TopCardVoteView?;
    @IBOutlet var bottomVote: BottomCardVoteView?;

    override func viewDidLoad() {
        super.viewDidLoad()
        topVote?.view.layer.cornerRadius = 15;
        topVote?.view.layer.masksToBounds = true;

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
