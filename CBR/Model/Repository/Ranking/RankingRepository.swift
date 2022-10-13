//
//  RankingRepository.swift
//  CBR
//
//  Created by Micah Meadows on 10/12/22.
//

import Foundation

protocol RankingsRepository {
    func getRankings() async -> [Ranking];
}
