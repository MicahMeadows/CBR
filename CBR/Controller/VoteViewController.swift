//
//  RankingsViewController.swift
//  CBR
//
//  Created by Micah Meadows on 10/4/22.
//

import UIKit


class TopCardDelegate: CardVoteDelegate {
    var vc: VoteViewController!;
    init(_ vc: VoteViewController) {
        self.vc = vc;
    }
    func onVote() {
        self.vc.onMatchStartLoad();
        if let cMatch = vc.voteViewModel.currentMatch {
            Task {
                await vc.voteViewModel.submitSelection(selection: cMatch.redTeam);
            }
            vc.onMatchLoad();
        }
    }
}

class BottomCardDelegate: CardVoteDelegate {
    var vc: VoteViewController!;
    init(_ vc: VoteViewController) {
        self.vc = vc;
    }
    func onVote() {
        self.vc.onMatchStartLoad();
        if let cMatch = vc.voteViewModel.currentMatch {
            Task {
                await vc.voteViewModel.submitSelection(selection: cMatch.blueTeam);
            }
            vc.onMatchLoad();
        }
    }
}


class VoteViewController: UIViewController, MatchViewDelegate {
    @IBOutlet var topVote: TopCardVoteView!;
    @IBOutlet var bottomVote: BottomCardVoteView!;
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!;
    @IBOutlet var mainContent: UIView!;
    
    var topImage: UIImageView {
        return topVote.image;
    }
    
    var bottomImage: UIImageView {
        return bottomVote.image;
    }
    
    var topDelegate: TopCardDelegate!;
    var bottomDelegate: BottomCardDelegate!;
    
    var voteViewModel: VoteViewModel!;
    
    func onMatchLoad() {
        updateView();
        DispatchQueue.main.async {
            UIView.transition(with: self.mainContent, duration: 0.5, options: .transitionCrossDissolve) {
                self.mainContent.isHidden = false;
            }
            UIView.transition(with: self.activityIndicator, duration: 0.5, options: .transitionCrossDissolve) {
                self.activityIndicator.isHidden = true;
            }
        }
    }
    
    func onMatchStartLoad() {
        DispatchQueue.main.async {
            UIView.transition(with: self.mainContent, duration: 0.5, options: .transitionCrossDissolve) {
                self.mainContent.isHidden = true;
            }
            UIView.transition(with: self.activityIndicator, duration: 0.5, options: .transitionCrossDissolve) {
                self.activityIndicator.isHidden = false;
            }
        }
    }
    
    func updateView() {
        if let match = voteViewModel.currentMatch {
            DispatchQueue.main.async {
                let topTeam = match.redTeam;
                let bottomTeam = match.blueTeam;
                
                self.topVote.label.text = topTeam.name;
                self.bottomVote.label.text = bottomTeam.name;
                
                let topURL = URL(string: topTeam.imageUrl)!;
                let bottomURL = URL(string: bottomTeam.imageUrl)!;
                
                if let topData = try? Data(contentsOf: topURL) {
                    if let topImage = UIImage(data: topData) {
                        self.topImage.image = topImage;
                    }
                }
                
                if let bottomData = try? Data(contentsOf: bottomURL) {
                    if let bottomImage = UIImage(data: bottomData) {
                        self.bottomImage.image = bottomImage;
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let matchRepository = APIMatchRepositoryImpl();
        voteViewModel = VoteViewModel(matchRepository: matchRepository, delegate: self);
        
        topDelegate = TopCardDelegate(self);
        bottomDelegate = BottomCardDelegate(self);
        topVote.delegate = topDelegate;
        bottomVote.delegate = bottomDelegate;
        

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
