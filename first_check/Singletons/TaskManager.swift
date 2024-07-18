//
//  TaskManager.swift
//  first_check
//
//  Created by Raheem Campbell on 7/9/24.
//

import SwiftUI

class TaxManager: ObservableObject {
    static let shared = TaxManager()
    
    @Published var taxRate: Double = 0.0
    
    private init() {}
}

