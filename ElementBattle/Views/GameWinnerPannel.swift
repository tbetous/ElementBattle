//
//  GameWinnerPannel.swift
//  ElementBattle
//
//  Created by Thomas Betous on 08/01/2024.
//

import SwiftUI

struct GameWinnerPannel: View {
    var playerScore: Int
    var computerScore: Int
    
    var body: some View {
        VStack {
            if playerScore > computerScore {
                Image(systemName: "trophy.fill")
                    .font(.system(size: 200))
                    .foregroundColor(.yellow)
                Text("Congrats you win!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            } else if computerScore > playerScore {
                Image(systemName: "desktopcomputer")
                    .font(.system(size: 200))
                    .foregroundColor(.red)
                Text("Computer win!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            } else {
                Image(systemName: "equal.circle.fill")
                    .font(.system(size: 200))
                    .foregroundColor(.gray)
                Text("No winner!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    GameWinnerPannel(playerScore: 12, computerScore: 13)
}
