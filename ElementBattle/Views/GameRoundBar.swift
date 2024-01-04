//
//  RoundBar.swift
//  ElementBattle
//
//  Created by Thomas Betous on 06/01/2024.
//

import SwiftUI

struct GameRoundBar: View {
    var rounds : [RoundStatus]
    
    var body: some View {
        HStack {
            ForEach(rounds, id: \.self) { round in
                switch round {
                case .lost:
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 20))
                case .won:
                    Image(systemName: "trophy.circle.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 20))
                case .draw:
                    Image(systemName: "slash.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 20))
                case .inProgress:
                    Image(systemName: "target")
                        .foregroundColor(.blue)
                        .font(.system(size: 20))
                case .notStarted:
                    Image(systemName: "circle")
                        .foregroundColor(.gray)
                        .font(.system(size: 20))
                }

            }
        }
    }
}

#Preview {
    GameRoundBar(rounds: [.won, .lost, .draw, .inProgress, .notStarted])
}
