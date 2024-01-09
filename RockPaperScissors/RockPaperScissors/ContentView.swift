//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Carl-Johan Lindblad on 2024-01-09.
//

import SwiftUI

enum Choice: String, CaseIterable {
    case rock = "👊"
    case paper = "✋"
    case scissors = "✌️"
}

enum Outcome: String {
    case win, lose, draw
}

func getOutcome(player: Choice, computer: Choice) -> Outcome {
    return switch (player, computer) {
    case (.rock, .rock): .draw
    case (.rock, .paper): .lose
    case (.rock, .scissors): .win
    case (.paper, .rock): .win
    case (.paper, .paper): .draw
    case (.paper, .scissors): .lose
    case (.scissors, .rock): .lose
    case (.scissors, .paper): .win
    case (.scissors, .scissors): .draw
    }
}

func randomChoice() -> Choice {
    return Choice.allCases.randomElement() ?? .rock
}

struct ContentView: View {
    @State private var computerChoice = randomChoice()
    @State private var latestOutcome: Outcome?
    @State private var score = 0
    @State private var desiredOutcome: Outcome = .win
    @State private var currentRound = 1
    @State private var gameFinished = false
    let maxRound = 10
    
    func resetGame() {
        computerChoice = randomChoice()
        latestOutcome = nil
        score = 0
        desiredOutcome = .win
        currentRound = 1
        gameFinished = false
    }
    
    func playerMove(choice: Choice) {
        let outcome = getOutcome(player: choice, computer: computerChoice)
        latestOutcome = outcome
        
        if desiredOutcome == outcome {
            score += 1
        } else {
            score -= 1
        }
        
        if currentRound < maxRound {
            desiredOutcome = nextDesiredOutcome(desiredOutcome)
            computerChoice = randomChoice()
            currentRound += 1
        } else {
            gameFinished = true
        }
    }
    
    func nextDesiredOutcome(_ current: Outcome) -> Outcome {
        return if current == .win {
            .lose
        } else {
            .win
        }
    }
    
    var body: some View {
        VStack {
            Text("Round \(currentRound)/\(maxRound)")
            Text("Score: \(score)")
            Spacer()
            Text("try to")
                .font(.headline)
                .fontWeight(.medium)
            Text(desiredOutcome.rawValue.uppercased())
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(computerChoice.rawValue)
                .font(.system(size: 80))
                .padding()
            HStack {
                ForEach(Choice.allCases, id: \.self) { choice in
                    Button("\(choice.rawValue)") {
                        playerMove(choice: choice)
                    }
                    .font(.largeTitle)
                    .buttonStyle(.borderedProminent)
                    .padding(5)
                }
            }
            .padding()
            Spacer()
        }
        .alert("Game finished", isPresented: $gameFinished) {
            Button("Start new game") {
                resetGame()
            }
        } message: {
            Text("Your total score was \(score)")
        }
        
    }
}

#Preview {
    ContentView()
}
