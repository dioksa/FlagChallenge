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
    
    private var countriesData: [(name: String, flag: String)] = []
    private var questionCount = 0
    private var correctAnswer = ""

    init() {
        loadCountriesData()
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
    
    private func loadCountriesData() {
        for code in NSLocale.isoCountryCodes {
            let flag = String.emojiFlag(for: code)
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            
            if let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id),
               let flag = flag,
               name != "Russia" {
                countriesData.append((name: name, flag: flag))
            }
        }
    }
    
    private func generateQuestion() {
        guard let correctCountry = countriesData.randomElement() else { return }
        flag = correctCountry.flag
        correctAnswer = correctCountry.name
        
        var wrongAnswers = countriesData.filter { $0.name != correctCountry.name }.map { $0.name }
        wrongAnswers.shuffle()
        let wrongAnswer = wrongAnswers.prefix(1).first ?? ""
        
        options = [correctCountry.name, wrongAnswer].shuffled()
    }
}
