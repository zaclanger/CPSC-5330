//
//  ConverterLogic.swift
//  Assignment6
//
//  Created by Zachary Langer on 6/26/24.
//

import Foundation

struct ConverterLogic {
    
    func convertCAD(_ dollarsIn : Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        let convertedCAD = Float(dollarsIn) * 1.37
        let formattedCAD = "$" + formatter.string(for: convertedCAD)!
        return formattedCAD
    }
    
    func convertYen(_ dollarsIn : Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        let convertedYEN = Float(dollarsIn) * 160.39
        let formattedYEN = "¥" + formatter.string(for: convertedYEN)!
        return formattedYEN
    }
    
    func convertEuros(_ dollarsIn : Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        let convertedEuros = Float(dollarsIn) * 0.94
        let formattedEuros = "€" + formatter.string(for: convertedEuros)!
        return formattedEuros
    }
    
    func convertPounds(_ dollarsIn : Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        let convertedPounds = Float(dollarsIn) * 0.79
        let formattedPounds = "£" + formatter.string(for: convertedPounds)!
        return formattedPounds
    }
}
