//
//  ContentView.swift
//  ElementBattle
//
//  Created by Thomas Betous on 04/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var game = Game(roundMaxNumber: 5)
    @State private var showResultAlert = false
    @State private var showWinnerPannel = false
    
    var resultTitle: String {
        switch game.currentRound.status {
        case .won:
            return "You win!"
        case .lost:
            return "You lose!"
        default:
            return "Draw!"
        }
    }
    var resultMessage: String {
        switch game.currentRound.status {
        case .won:
            return "You have chosen \(game.currentRound.playerChoice?.rawValue ?? "?") and the computer has chosen \(game.currentRound.computerChoice?.rawValue ?? "?")"
        case .lost:
            return "The computer has chosen \(game.currentRound.computerChoice?.rawValue ?? "?") but you have chosen \(game.currentRound.playerChoice?.rawValue ?? "?")"
        default:
            return "You have both chosen \(game.currentRound.playerChoice?.rawValue ?? "?"). No winner."
        }
        
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Element Battle")
                    .font(.largeTitle)
                GameStatusBar(game: game)
                Group {
                    if(game.isOver && showWinnerPannel) {
                        GameWinnerPannel(playerScore: game.playerScore, computerScore: game.computerScore)
                        Button("Play again") {
                            game.reset()
                            showWinnerPannel = false
                        }
                        .buttonStyle(.borderedProminent)
                    } else {
                        GameChoicePannel(onChoice: fight)
                    }
                }.padding()
                Spacer()
            }
            .alert(resultTitle, isPresented: $showResultAlert) {
                if(game.isOver) {
                    Button("Let's see the result") {
                        showWinnerPannel = true
                    }
                } else {
                    Button("Next round") {
                        game.nextRound()
                    }
                }
            } message: {
                Text(resultMessage)
            }
            .padding()
        }
    }
    
    func fight(element: Element) {
        game.fight(with: element)
        showResultAlert = true
    }
}

#Preview {
    ContentView()
}
