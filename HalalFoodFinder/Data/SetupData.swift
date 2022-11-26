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

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
    
    func clean() -> String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}


public let cuisines = [
    "western",
    "thai",
    "chinese",
    "fusion",
    "dessert",
    "heavy meal",
    "japanese",
]
