//
//  GameView.swift
//  FlagChallenge
//
//  Created by Oksana Dionisieva on 24.01.2025.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    @State private var showAlert = false
    @State private var isGameFinished = false

    var body: some View {
        VStack {
            if isGameFinished {
                FinishView(correctAnswers: viewModel.correctAnswersCount,
                           wrongAnswers: viewModel.wrongAnswersCount, restartGame: {
                    viewModel.resetGame()
                    isGameFinished = false
                })
            } else {
                Text("What country do you think this flag belongs to?")
                    .padding(.bottom, 24)
                
                Text(viewModel.flag)
                    .font(.system(size: 100))
                    .padding(.bottom, 24)
                
                ForEach(viewModel.options, id: \.self) { option in
                    Button(action: {
                        viewModel.checkAnswer(selectedOption: option)
                        showAlert = true
                        if viewModel.isGameFinished {
                            isGameFinished = true
                        }
                    }) {
                        Text(option)
                            .font(.headline)
                            .frame(width: 180, height: 52)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 12)
                }
            }
        }
        .toast(isPresented: $showAlert, message: viewModel.answerResult?.messageDescription)
    }
}

#Preview {
    GameView()
}
