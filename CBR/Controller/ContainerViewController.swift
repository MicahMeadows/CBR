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
    
    lazy var moreVC: MoreViewController? = {
        let storyboard = UIStoryboard(name: "Main", bundle: .main);
        var vc: MoreViewController?;
        if let viewController = storyboard.instantiateViewController(withIdentifier: "MoreViewController") as?
            MoreViewController {
            vc = viewController;
        }
        return vc;
    }();
    
    private func hideAllPages() {
        rankingsVC?.view.isHidden = true;
        voteVC?.view.isHidden = true;
        moreVC?.view.isHidden = true;
    }
    
    private func showMorePage() {
        hideAllPages();
        moreVC?.view.isHidden = false;
    }
    
    private func showVotePage() {
        hideAllPages();
        voteVC?.view.isHidden = false;
    }
    
    private func showRankingsPage() {
        hideAllPages();
        if (rankingsVC?.view.isHidden ?? false) {
            rankingsVC?.view.isHidden = false;
            rankingsVC?.loadRankings();
        }
    }
    
    @objc func goMorePage(_ notif: Notification) {
        showMorePage();
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(goMorePage(_:)), name: NSNotification.Name("navigate.more"), object: nil);
        
        addChild(rankingsVC!);
        addChild(voteVC!);
        addChild(moreVC!);
        
        
        self.view.addSubview(rankingsVC!.view);
        self.view.addSubview(voteVC!.view);
        self.view.addSubview(moreVC!.view);
        
        rankingsVC?.didMove(toParent: self);
        voteVC?.didMove(toParent: self);
        moreVC?.didMove(toParent: self);
        
        rankingsVC?.view.frame = self.view.bounds;
        voteVC?.view.frame = self.view.bounds;
        moreVC?.view.frame = self.view.bounds;
        
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
