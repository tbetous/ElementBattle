//
//  GameStatusBar.swift
//  ElementBattle
//
//  Created by Thomas Betous on 06/01/2024.
//

import SwiftUI

struct GameStatusBar: View {
    var game: Game
    
    var body: some View {
        VStack(spacing: 10) {
            GameScore(playerScore: game.playerScore, computerScore: game.computerScore)
            GameRoundBar(rounds: game.rounds.map { $0.status })
        }
    }
}

#Preview {
    GameStatusBar(game: Game(roundMaxNumber: 10))
}
