//
//  Item.swift
//  FlagChallenge
//
//  Created by Oksana Dionisieva on 24.01.2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
