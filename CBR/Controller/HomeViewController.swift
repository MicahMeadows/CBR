//
//  ViewControllerP1.swift
//  CBR
//
//  Created by Micah Meadows on 9/27/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var containerView: UIView?;
    
    @IBOutlet weak var rankingsLbl: UILabel!;
    @IBOutlet weak var rankingsIcon: UIImageView!;
    
    @IBOutlet weak var voteLbl: UILabel!;
    @IBOutlet weak var voteIcon: UIImageView!;
    
    @IBOutlet weak var moreLbl: UILabel!;
    @IBOutlet weak var moreIcon: UIImageView!;
    
    
    func goVotePage() {
        showVoteTab();
        NotificationCenter.default.post(name: NSNotification.Name("navigate.vote"), object: nil);
    }
    
    func goRankingsPage() {
        showRankingsTab();
        NotificationCenter.default.post(name: NSNotification.Name("navigate.rankings"), object: nil);
    }
    
    func goMorePage() {
        showMoreTab();
        NotificationCenter.default.post(name: NSNotification.Name("navigate.more"), object: nil);
    }
    
    override func viewDidLoad() {
        
        let rankingsIconGesture = UITapGestureRecognizer(target: self, action: #selector(rankingsGestureFired(_:)))
        let rankingsLblGesture = UITapGestureRecognizer(target: self, action: #selector(rankingsGestureFired(_:)))
        
        let voteIconGesture = UITapGestureRecognizer(target: self, action: #selector(voteGestureFired(_:)))
        let voteLblGesture = UITapGestureRecognizer(target: self, action: #selector(voteGestureFired(_:)))
        
        let moreIconGesture = UITapGestureRecognizer(target: self, action: #selector(moreGestureFired(_:)))
        let moreLblGesture = UITapGestureRecognizer(target: self, action: #selector(moreGestureFired(_:)))
        
        rankingsLbl.isUserInteractionEnabled = true;
        rankingsIcon.isUserInteractionEnabled = true;
        rankingsIcon.addGestureRecognizer(rankingsIconGesture);
        rankingsLbl.addGestureRecognizer(rankingsLblGesture);
        
        voteLbl.isUserInteractionEnabled = true;
        voteIcon.isUserInteractionEnabled = true;
        voteIcon.addGestureRecognizer(voteIconGesture);
        voteLbl.addGestureRecognizer(voteLblGesture);
        
        moreLbl.isUserInteractionEnabled = true;
        moreIcon.isUserInteractionEnabled = true;
        moreIcon.addGestureRecognizer(moreIconGesture);
        moreLbl.addGestureRecognizer(moreLblGesture);
        
        goVotePage();
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func hideAllTabs() {
        self.rankingsLbl.isHidden = true;
        self.voteLbl.isHidden = true;
        self.moreLbl.isHidden = true;
    }
    
    func showVoteTab() {
        self.hideAllTabs();
        UIView.transition(with: voteLbl, duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
            self.voteLbl.isHidden = false;
        });
    }
    
    func showRankingsTab() {
        self.hideAllTabs();
        UIView.transition(with: rankingsLbl, duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
            self.rankingsLbl.isHidden = false;
        });
    }
    
    func showMoreTab() {
        self.hideAllTabs();
        UIView.transition(with: moreLbl, duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
            self.moreLbl.isHidden = false;
        });
    }
    
    @objc func voteGestureFired(_ gesture: UITapGestureRecognizer) {
        goVotePage();
    }
    
    @objc func rankingsGestureFired(_ gesture: UITapGestureRecognizer) {
        goRankingsPage();
    }
    
    @objc func moreGestureFired(_ gesture: UITapGestureRecognizer) {
        goMorePage();
    }
}
