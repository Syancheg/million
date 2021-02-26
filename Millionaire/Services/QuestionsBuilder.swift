//
//  QuestionsBuilder.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 25.02.2021.
//

import UIKit

class QuestionsBuilder {
    
    private(set) var cells: [QuestionCell] = []
    private(set) var questions: [Question] = []

    func build() -> [Question]{
        cells.forEach { (cell) in
            guard let question = cell.question.text,
                  question != "" else {return}
            let answers = cell.answers.map { $0.text ?? "Неизвестно" }
            let correctAnswer = cell.correctAnswer.selectedSegmentIndex
            let newQuestion = Question(question: question, answers: answers, correctAnswer: correctAnswer)
            questions.append(newQuestion)
        }
        return questions
    }

    func setQuestions(_ cells: [QuestionCell]){
        self.cells = cells
    }

    
}
