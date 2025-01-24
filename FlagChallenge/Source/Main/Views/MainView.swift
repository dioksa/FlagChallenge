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
                Text("Welcome \nto our amazing \n game!")
                    .font(FontStyle.regularLobster.font(size: .h48))
                    .padding(.top, 48)
                    .padding([.leading, .trailing], 24)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                Text("Please click the button bellow to start")
                    .font(FontStyle.regular.font(size: .h24))
                    .padding(.top, 24)
                    .padding([.leading, .trailing], 24)
                    .multilineTextAlignment(.center)
                Spacer()

                NavigationLink(destination: GameView()) {
                    CustomButtonStyle(title: "Start")
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
