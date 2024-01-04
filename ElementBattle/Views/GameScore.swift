//
//  Score.swift
//  ElementBattle
//
//  Created by Thomas Betous on 08/01/2024.
//

import SwiftUI

struct GameScore: View {
    var playerScore: Int
    var computerScore: Int
    
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
            Text("\(playerScore) - \(computerScore)")
            Image(systemName: "desktopcomputer")
            
        }
        .foregroundColor(.gray)
    }
}

#Preview {
    GameScore(playerScore: 1, computerScore: 0)
}
