//
//  RandomColorGenerator.swift
//  stocks-test-app
//
//  Created by vladimir.kuzomenskyi on 05.05.2022.
//

import Foundation

class RandomColorGenerator: NSObject {
    // MARK: Constant
    
    // MARK: Private Constant
    
    // MARK: Variable
    static var shared = RandomColorGenerator()
    
    // MARK: Private Variable
    
    // MARK: Init
    private override init() {}
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    
    // Generate a random color in HEX
    func generateRandomColor() -> String {
        var characterArray: [String] = []
        for _ in 0...5 {
            characterArray.append(randomCharacter()!)
        }
        return "#" + characterArrayToHexString(array: characterArray)
    }
    
    // Generate an palette (array) of random HEX colors
    func generateRandomPalette(amount: Int) -> [String] {
        var colors: [String] = []
        for _ in 0...amount - 1 {
            colors.append(generateRandomColor())
        }
        return colors
    }
    
    // MARK: Private Function
    /* Randomly choose if number of letter, then randomly give
     back a value */
    private func randomCharacter() -> String? {
        let numbers = [0,1,2,3,4,5,6, 7, 8, 9]
        let letters = ["A","B","C","D","E","F"]
        
        let numberOrLetter = arc4random_uniform(2)
        
        switch numberOrLetter {
        case 0: return String(numbers[Int(arc4random_uniform(10))])
        case 1: return letters[Int(arc4random_uniform(6))]
        default: return nil
        }
    }
    
    /* Translate a character array of a color to a string
     representing a HEX*/
    private func characterArrayToHexString(array: [String]) -> String {
        var hexString = ""
        for character in array {
            hexString += character
        }
        return hexString
    }
}
