//
//  CollectionModel.swift
//  First Check
//
//  Created by Raheem Campbell on 7/6/24.
//

import SwiftData
import Foundation

@Model
final class Item {
    var id: UUID
    var name: String
    var price: Double
    var quantity: Int

    init(name: String, price: Double, quantity: Int) {
        self.id = UUID()
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}
