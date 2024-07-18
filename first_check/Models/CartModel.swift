//
//  CartModel.swift
//  first_check
//
//  Created by Raheem Campbell on 7/8/24.
//

import SwiftData
import Foundation

@Model
class Cart {
    @Attribute(.unique) let id: UUID
    var name: String
    var cash: Double
    
    
    init(id: UUID = UUID(), name: String, cash: Double) {
        self.id = id
        self.name = name
        self.cash = cash
    }
}

