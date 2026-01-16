//
//  Team.swift
//  GoTracker1
//
//  Created by Veer Patel on 1/14/26.
//
import SwiftUI

class Team: Identifiable {
    var teamName: String
    var player: String
    var playerNumber: String
    var playerPosition: String
    
    init(teamName: String, player: String, playerNumber: String, playerPosition: String) {
        self.teamName = teamName
        self.player = player
        self.playerNumber = playerNumber
        self.playerPosition = playerPosition
    }
}
