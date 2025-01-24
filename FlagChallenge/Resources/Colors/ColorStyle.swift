//
//  ColorStyle.swift
//  FlagChallenge
//
//  Created by Oksana Dionisieva on 24.01.2025.
//

import SwiftUI

enum ColorStyle {
    case eucalyptus
    case gin
}

extension Color {
    /// #248641 - rgb(36 134 65)
    static let eucalyptus = Color(#colorLiteral(red: 0.1411764706, green: 0.5254901961, blue: 0.2549019608, alpha: 1))
    /// #FF6E27 - rgb(255 110 39)
    static let orange = Color(#colorLiteral(red: 1, green: 0.431372549, blue: 0.1529411765, alpha: 1))
}
