//
//  GameSession.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 19.02.2021.
//

import UIKit

class GameSession: Codable {
    
    var countQuestions: Int
    var countCorrectAnswer: Int = 0
    var countScope: Int = 0
    var percent: Int = 0
    
    init(questions: Int) {
        countQuestions = questions
    }
}

extension GameSession: GameViewControllerSessionDelegate {
    func updateData(correctAnswer: Int) {
        countCorrectAnswer = correctAnswer
        countScope = correctAnswer
        let percent = (Float(countCorrectAnswer) / Float(countQuestions)) * 100
        self.percent = Int(percent)
    }
}
