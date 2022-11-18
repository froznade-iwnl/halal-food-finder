//
//  SetupData.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 5/11/22.
//

import Foundation
import SwiftUI

extension Color {
    static let bgColor = Color("BGColor")
}

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

public let cuisines = [
    "Western",
    "Thai",
    "Chinese",
    "Fusion",
    "Dessert",
    "Heavy Meal",
    "Indian"
]
