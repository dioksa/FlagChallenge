//
//  View+Extension.swift
//  FlagChallenge
//
//  Created by Oksana Dionisieva on 24.01.2025.
//

import SwiftUI

extension View {
    func toast(isPresented: Binding<Bool>, message: String?) -> some View {
        ZStack {
            self
            if isPresented.wrappedValue, let message = message {
                VStack {
                    Spacer()
                    Text(message)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 40)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isPresented.wrappedValue = false
                            }
                        }
                }
                .transition(.opacity)
            }
        }
    }
}
