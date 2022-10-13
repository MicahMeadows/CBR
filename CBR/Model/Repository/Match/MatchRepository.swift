//
//  MatchRepository.swift
//  CBR
//
//  Created by Micah Meadows on 10/4/22.
//

import Foundation

protocol MatchRepository {
    func submitMatch(result: MatchResult) async;
    func getNewMatch() async -> Match;
}
