//
//  Item.swift
//  diGOP
//
//  Created by Benedictus Yogatama Favian Satyajati on 20/03/25.
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
