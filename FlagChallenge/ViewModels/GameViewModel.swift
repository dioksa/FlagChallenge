//
//  GameViewModel.swift
//  FlagChallenge
//
//  Created by Oksana Dionisieva on 24.01.2025.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var flag: String = ""
    @Published var options: [String] = []
    @Published var isGameFinished: Bool = false

    private let countries = [
        ("USA", "🇺🇸"), ("Canada", "🇨🇦"), ("Mexico", "🇲🇽"),
        ("Germany", "🇩🇪"), ("France", "🇫🇷"), ("Italy", "🇮🇹"),
        ("Ukraine", "🇺🇦"), ("Japan", "🇯🇵"), ("China", "🇨🇳"),
        ("India", "🇮🇳"), ("Brazil", "🇧🇷"), ("Australia", "🇦🇺"),
        ("United Kingdom", "🇬🇧"), ("South Korea", "🇰🇷"),
        ("South Africa", "🇿🇦"), ("Argentina", "🇦🇷"),
        ("Spain", "🇪🇸"), ("Egypt", "🇪🇬"), ("Nigeria", "🇳🇬"),
        ("Turkey", "🇹🇷")
    ]
    
    private var questionCount: Int = 0
    private var correctAnswer: String = ""

    init() {
        generateQuestion()
    }
    
    func checkAnswer(selectedOption: String) {
        if selectedOption == correctAnswer {
            print("Correct!")
        } else {
            print("Wrong answer!")
        }
        
        questionCount += 1

        if questionCount >= 5 {
            isGameFinished = true
        } else {
            generateQuestion()
        }
    }
    
    private func generateQuestion() {
        let correctCountry = countries.randomElement()!
        flag = correctCountry.1
        correctAnswer = correctCountry.0
        
        var wrongAnswers = countries.filter { $0.0 != correctCountry.0 }.map { $0.0 }
        wrongAnswers.shuffle()
        let wrongAnswer = wrongAnswers.prefix(1).first ?? ""
        
        options = [correctCountry.0, wrongAnswer].shuffled()
    }
}
