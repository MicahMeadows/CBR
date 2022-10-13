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
        if let cMatch = vc.voteViewModel.currentMatch {
            Task {
                await vc.voteViewModel.submitSelection(selection: cMatch.redTeam);
            }
            vc.updateView();
        }
    }
}

class BottomCardDelegate: CardVoteDelegate {
    var vc: VoteViewController!;
    init(_ vc: VoteViewController) {
        self.vc = vc;
    }
    func onVote() {
        if let cMatch = vc.voteViewModel.currentMatch {
            Task {
                await vc.voteViewModel.submitSelection(selection: cMatch.blueTeam);
            }
            vc.updateView();
        }
    }
}


class VoteViewController: UIViewController, MatchViewDelegate {
    @IBOutlet var topVote: TopCardVoteView!;
    @IBOutlet var bottomVote: BottomCardVoteView!;
    
    var topDelegate: TopCardDelegate!;
    var bottomDelegate: BottomCardDelegate!;
    
    var voteViewModel: VoteViewModel!;
    
    func onMatchLoad() {
        updateView();
    }
    
    func onMatchStartLoad() {
        print("load start...");
    }
    
    func updateView() {
        if let match = voteViewModel.currentMatch {
            print("Match \(match.matchID)");
            DispatchQueue.main.async {
                self.topVote.label.text = match.redTeam.name;
                self.bottomVote.label.text = match.blueTeam.name;
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let matchRepository = TestMatchRepositoryImpl();
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
