//
//  Item.swift
//  SaveLink
//
//  Created by Ruben on 28/5/24.
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
