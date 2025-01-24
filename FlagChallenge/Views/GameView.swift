////
////  GameView.swift
////  FlagChallenge
////
////  Created by Oksana Dionisieva on 24.01.2025.
////
///

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("What country do you think this flag belongs to?")
                    .padding(.bottom, 24)
                
                Text(viewModel.flag)
                    .font(.system(size: 100))
                    .padding(.bottom, 24)
                
                ForEach(viewModel.options, id: \.self) { option in
                    Button(action: {
                        viewModel.checkAnswer(selectedOption: option)
                    }) {
                        Text(option)
                            .font(.headline)
                            .frame(width: 150, height: 52)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 12)
                }
            }
            .navigationDestination(isPresented: $viewModel.isGameFinished) {
                NextScreen()
            }
        }
    }
}

struct NextScreen: View {
    var body: some View {
        VStack {
            Text("You've completed the game!")
                .font(.title)
                .padding()
        }
    }
}

#Preview {
    GameView()
}
