//
//  View+Extension.swift
//  FlagChallenge
//
//  Created by Oksana Dionisieva on 24.01.2025.
//

import SwiftUI

extension View {
    func toast(isPresented: Binding<Bool>, message: String?, isButtonDisabled: Binding<Bool>) -> some View {
        ZStack {
            self
            if isPresented.wrappedValue, let message = message {
                VStack {
                    Spacer()
                    Text(message)
                        .font(FontStyle.regular.font(size: .h18))
                        .padding()
                        .background(Color.orange.opacity(0.4))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.bottom, 24)
                        .onAppear {
                            isButtonDisabled.wrappedValue = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                isPresented.wrappedValue = false
                                isButtonDisabled.wrappedValue = false
                            }
                        }
                }
                .transition(.opacity)
            }
        }
    }
}
