//
//  FontStyle.swift
//  FlagChallenge
//
//  Created by Oksana Dionisieva on 24.01.2025.
//

import SwiftUI

enum FontStyle {
    case regular
    case regularLobster
    case medium
    
    func font(size: Size) -> Font {
        switch self {
            case .regular:
                return .custom(Name.regular.rawValue, size: size.rawValue)
            case .regularLobster:
                return .custom(Name.regularLobster.rawValue, size: size.rawValue)
            case .medium:
                return .custom(Name.medium.rawValue, size: size.rawValue)
        }
    }
}

enum Name: String {
    case regular = "CormorantGaramond-Regular"
    case regularLobster = "Lobster-Regular"
    case medium = "CormorantGaramond-Medium"
}

enum Size: CGFloat {
    case h18 = 18.0
    case h20 = 20.0
    case h24 = 24.0
    case h48 = 48.0
}
