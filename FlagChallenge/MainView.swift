//
//  MainView.swift
//  FlagChallenge
//
//  Created by Oksana Dionisieva on 24.01.2025.
//

import SwiftUI
import SwiftData

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to our amazing game!")
                    .font(.title)
                    .padding([.top, .leading, .trailing], 24)
                Spacer()

                NavigationLink(destination: NextScreen()) {
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


struct NextScreen: View {
    var body: some View {
        Text("You are now on the next screen!")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    MainView()
}
