//
//  RankingsViewModel.swift
//  CBR
//
//  Created by Micah Meadows on 10/12/22.
//

import Foundation

class RankingsViewModel {
    let rankingsRepository: RankingsRepository;
    let rankingsViewDelegate: RankingsViewDelegate;
    
    var loadedRankings: [Ranking] = [];
    
    func loadRankings() async {
        rankingsViewDelegate.onRankingsLoading();
        
        let newRankings = await rankingsRepository.getRankings();
        
        loadedRankings = newRankings;
        
        rankingsViewDelegate.onRankingsLoaded();
    }
    
    init(rankingsRepository: RankingsRepository, rankingsViewDelegate: RankingsViewDelegate) {
        self.rankingsRepository = rankingsRepository;
        self.rankingsViewDelegate = rankingsViewDelegate;
    }
    
}
