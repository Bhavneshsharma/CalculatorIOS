//
//  calculatorModel.swift
//  CalculatorIOS
//
//  Created by Bhavnesh Sharma on 13/09/23.
//

import Foundation
import SwiftUI

enum Keys : String {
    case one = "1"
    case tow = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiple = "x"
    case devide = "÷"
    case equale = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var buttonColour :  Color {
        switch self{
        case .add, .subtract, .multiple, .devide, .equale:
            return Color("Hoperator")
        case .clear, .negative, .percent :
            return Color("Voperator")
        default :
            return Color("num")
        }
    }
}

enum Operation{
    case add, subtract, multiply, divide, none
}
