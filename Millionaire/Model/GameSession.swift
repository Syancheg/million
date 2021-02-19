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

extension GameSession: GameSessionDelegate{
    func updateData(correctAnswer: Int) {
        countCorrectAnswer = correctAnswer
        countScope = correctAnswer
    }
}
