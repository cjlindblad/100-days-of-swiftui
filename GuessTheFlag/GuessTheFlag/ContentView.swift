//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Carl-Johan Lindblad on 2024-01-08.
//

import SwiftUI

struct FlagImage: View {
    let country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var showingSummary = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var round = 1
    @State private var tappedFlagIndex = -1
    let maxRound = 8
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                           center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { index in
                        Button {
                            withAnimation {
                                tappedFlagIndex = index
                            }
                            flagTapped(index)
                        } label: {
                            FlagImage(country: countries[index])
                        }
                        .rotationEffect(.degrees(tappedFlagIndex == index ? 360 : 0))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("Round \(round)/\(maxRound)")
                    .foregroundStyle(.white)
                
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("", isPresented: $showingSummary) {
            Button("OK", action: reset)
        } message: {
            Text("You got \(score)/\(maxRound) flags right! Press OK to play again.")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
        }
        if round < maxRound {
            if number == correctAnswer {
                scoreTitle = "Correct"
            } else {
                scoreTitle = "Wrong! That's the flag of \(countries[number])"
            }
            
            round += 1
            showingScore = true
        } else {
            showingSummary = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        score = 0
        round = 1
        askQuestion()
    }
}

#Preview {
    ContentView()
}
