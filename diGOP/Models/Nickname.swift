//
//  Nickname.swift
//  diGOP
//
//  Created by Benedictus Yogatama Favian Satyajati on 21/03/25.
//

import Foundation
import SwiftData

@Model
final class Nickname{
    @Attribute var name: String?
    
    init(name: String) {
        self.name = name
    }
}
