//
//  VoteViewModel.swift
//  CBR
//
//  Created by Micah Meadows on 10/6/22.
//

import Foundation

class VoteViewModel {
    let matchRepository: MatchRepository;
    var currentMatch: Match? = nil;
    
    let matchViewDelegate: MatchViewDelegate!;
    
    func loadNewMatch() async {
        currentMatch = matchRepository.getNewMatch();
        matchViewDelegate.onMatchLoad();
    }
    
    func submitSelection(selection: Location) async {
        if let match = currentMatch {
            let winner = selection;
            let loser = match.redTeam.id == selection.id ? match.blueTeam : match.redTeam;
            let result = MatchResult(matchID: match.matchID, winner: winner, loser: loser);
            matchRepository.submitMatch(result: result);
        }
        currentMatch = nil;
        await loadNewMatch();
    }
    
    init(matchRepository: MatchRepository, delegate: MatchViewDelegate) {
        self.matchRepository = matchRepository;
        self.matchViewDelegate = delegate;
        Task {
            await loadNewMatch();
        }
    }
}
