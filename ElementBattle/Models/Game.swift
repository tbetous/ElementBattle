//
//  Game.swift
//  ElementBattle
//
//  Created by Thomas Betous on 06/01/2024.
//

import Foundation

struct Round {
    private(set) var playerChoice: Element?
    private(set) var computerChoice: Element?
    
    var status: RoundStatus {
        if let playerChoice = playerChoice, let computerChoice = computerChoice {
            if playerChoice.weakness() == computerChoice {
                return .lost
            } else if (computerChoice.weakness() == playerChoice) {
                return .won
            } else {
                return .draw
            }
        } else if computerChoice != nil {
            return .inProgress
        } else {
            return .notStarted
        }
    }
    
    mutating func start() {
        computerChoice = Element.allCases.randomElement()
    }
    
    mutating func fight(with playerChoice: Element) {
        self.playerChoice = playerChoice
    }
}

struct Game {
    let roundMaxNumber: Int
    private(set) var roundNumber: Int
    private(set) var rounds: [Round]
    
    var playerScore: Int { rounds.filter { $0.status == .won}.count }
    var computerScore: Int { rounds.filter { $0.status == .lost}.count }
    var currentRound: Round { rounds[roundNumber - 1] }
    var isOver: Bool {roundMaxNumber == roundNumber && ![.inProgress, .notStarted].contains(rounds[roundNumber - 1].status)}
    
    init(roundMaxNumber: Int) {
        self.roundMaxNumber = roundMaxNumber
        self.roundNumber = 1
        self.rounds = Array(unsafeUninitializedCapacity: roundMaxNumber) { buffer, initializedCount in
            for i in 0..<roundMaxNumber {
                if i == 0 {
                    var round = Round()
                    round.start()
                    buffer[i] = round
                } else {
                    buffer[i] = Round()
                }
            }
            initializedCount = roundMaxNumber
        }
    }
    
    
    mutating func fight(with playerChoice: Element) {
        rounds[roundNumber - 1].fight(with: playerChoice)
    }
    
    mutating func nextRound() {
        if(!isOver) {
            rounds[roundNumber].start()
            roundNumber += 1
        }
    }
    
    mutating func reset() {
        self.roundNumber = 1
        self.rounds = Array(unsafeUninitializedCapacity: roundMaxNumber) { buffer, initializedCount in
            for i in 0..<roundMaxNumber {
                if i == 0 {
                    var round = Round()
                    round.start()
                    buffer[i] = round
                } else {
                    buffer[i] = Round()
                }
            }
            initializedCount = roundMaxNumber
        }
    }
}
