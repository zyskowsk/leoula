//
//  word.swift
//  leoula
//
//  Created by Rob Zyskowski on 18/06/16.
//  Copyright © 2016 Rob Zyskowski. All rights reserved.
//

import Foundation

class Word {
    var currentWord: String
    var currentGender: String
    var words: [[String]] = [
        ["pharmacie", "la"],
        ["bouquin", "le"],
        ["rue", "la"],
        ["saxaphone", "le"],
        ["chapelle", "la"],
        ["boudrier", "le"],
    ]

    init() {
        self.currentWord = "None"
        self.currentGender = "None"
        setCurrentWord()
    }

    func setCurrentWord() {
        let randomIndex = Int(arc4random_uniform(UInt32(words.count)))
        let randomWord = words[randomIndex]
        
        self.currentWord = randomWord[0]
        self.currentGender = randomWord[1]
    }
}
