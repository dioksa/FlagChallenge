//
//  ResultRow.swift
//  FlagChallenge
//
//  Created by Oksana Dionisieva on 24.01.2025.
//

import SwiftUI

struct ResultRow: View {
    var label: String
    var value: Int
    var backgroundColor: Color
    var textColor: Color

    var body: some View {
        HStack {
            Text(label)
                .font(FontStyle.medium.font(size: .h18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(textColor)
            Text("\(value)")
                .font(FontStyle.regularLobster.font(size: .h18))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(textColor)
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(8)
    }
}
