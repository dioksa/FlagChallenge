//
//  CustomButtonStyle.swift
//  FlagChallenge
//
//  Created by Oksana Dionisieva on 24.01.2025.
//

import SwiftUI

struct CustomButtonStyle: View {
    var title: String

    var body: some View {
        Text(title.uppercased())
            .font(FontStyle.regular.font(size: .h24))
            .frame(width: 180, height: 52)
            .background(Color.eucalyptus)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
