//
//  GameViewModel.swift
//  FlagChallenge
//
//  Created by Oksana Dionisieva on 24.01.2025.
//

import SwiftUI

enum AnswerResult {
    case success
    case failure
    
    var messageDescription: String {
        switch self {
            case .success:
                return "Success! Well done!"
            case .failure:
                return "It's wrong :( You can do better, let's go"
        }
    }
}

final class GameViewModel: ObservableObject {
    @Published var flag = ""
    @Published var options: [String] = []
    @Published var isGameFinished = false
    @Published var answerResult: AnswerResult?
    @Published var correctAnswersCount = 0
    @Published var wrongAnswersCount = 0
    
    private var countriesData: [(name: String, flag: String)] = []
    private var questionCount = 0
    private var correctAnswer = ""

    init() {
        loadCountriesData()
        generateQuestion()
    }
    
    func checkAnswer(selectedOption: String) {
        if selectedOption == correctAnswer {
            answerResult = .success
            correctAnswersCount += 1
        } else {
            answerResult = .failure
            wrongAnswersCount += 1
        }
        
        questionCount += 1
        
        if questionCount >= 5 {
            isGameFinished = true
        } else {
            generateQuestion()
        }
    }
    
    func resetGame() {
        countriesData.removeAll()
        isGameFinished = false
        questionCount = 0
        correctAnswersCount = 0
        wrongAnswersCount = 0
        correctAnswer = ""
        loadCountriesData()
        generateQuestion()
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
