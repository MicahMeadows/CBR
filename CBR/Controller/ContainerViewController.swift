//
//  ContainerViewController.swift
//  CBR
//
//  Created by Micah Meadows on 10/4/22.
//

import UIKit

class ContainerViewController: UIViewController {
    lazy var rankingsVC: RankingsViewController? = {
        let storyboard = UIStoryboard(name: "Main", bundle: .main);
        var vc: RankingsViewController?;
        if let viewController = storyboard.instantiateViewController(withIdentifier: "RankingsViewController") as? RankingsViewController {
            vc = viewController;
        }
        return vc;
    }();
    
    lazy var voteVC: VoteViewController? = {
        let storyboard = UIStoryboard(name: "Main", bundle: .main);
        var vc: VoteViewController?;
        if let viewController = storyboard.instantiateViewController(withIdentifier: "VoteViewController") as? VoteViewController {
            vc = viewController;
        }
        return vc;
    }();
    
    private func hideAllPages() {
        rankingsVC?.view.isHidden = true;
        voteVC?.view.isHidden = true;
    }
    
    private func showVotePage() {
        hideAllPages();
        voteVC?.view.isHidden = false;
    }
    
    private func showRankingsPage() {
        hideAllPages();
        rankingsVC?.view.isHidden = false;
    }
    
    private func setup() {
        addChild(rankingsVC!);
        addChild(voteVC!);
        
        self.view.addSubview(rankingsVC!.view);
        self.view.addSubview(voteVC!.view);
        
        rankingsVC?.didMove(toParent: self);
        voteVC?.didMove(toParent: self);
        
        rankingsVC?.view.frame = self.view.bounds;
        voteVC?.view.frame = self.view.bounds;
        
        hideAllPages();
    }
    
    @objc func goRankingPage(_ notif: Notification) {
        showRankingsPage();
    }
    
    @objc func goVotePage(_ notif: Notification) {
        showVotePage();
    }
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(goRankingPage(_:)), name: NSNotification.Name("navigate.rankings"), object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(goVotePage(_:)), name: NSNotification.Name("navigate.vote"), object: nil);
        
        setup();
        
        showRankingsPage();
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
