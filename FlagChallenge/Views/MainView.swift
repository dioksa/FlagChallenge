//
//  MainView.swift
//  FlagChallenge
//
//  Created by Oksana Dionisieva on 24.01.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to our amazing game!")
                    .font(.title)
                    .padding([.top, .leading, .trailing], 24)
                Spacer()

                NavigationLink(destination: GameView()) {
                    Text("Start".uppercased())
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 24)

                Image(.peopleIcon)
                    .resizable()
                    .scaledToFit()
            }
            .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    MainView()
}
