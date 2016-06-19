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
    var wordList: [[String]] = []

    init() {
        self.currentWord = "None"
        self.currentGender = "None"
        wordList = loadWords()
        setCurrentWord()
    }

    func setCurrentWord() {
        let randomIndex = Int(arc4random_uniform(UInt32(wordList.count)))
        let randomWord = wordList[randomIndex]
        
        self.currentWord = randomWord[0]
        self.currentGender = randomWord[1]
    }

    func loadWords() -> [[String]] {
        var list: [[String]] = []

        let path = NSBundle.mainBundle().pathForResource("word_list_level_6", ofType: "json")
        let data = try? String(contentsOfFile: path!).dataUsingEncoding(NSUTF8StringEncoding)!
        let json = try? NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)

        if let words = json as? [[String: AnyObject]] {
            for word in words {
                if let gender = word["gender"] as? String {
                    if let word = word["word"] as? String {
                        list.append([word, gender])
                    }
                }
            }
        }

        return list
    }
}
