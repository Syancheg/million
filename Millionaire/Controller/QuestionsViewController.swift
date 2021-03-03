//
//  QuestionsViewController.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 22.02.2021.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    lazy var contentView = self.view as! QuestionsView

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
    }
    
    private func saveQuestions(questions: [Question]){
        let caretaker = QuestionsCaretaker()
        caretaker.save(questions: questions)
        dismiss(animated: true, completion: nil)
    }
    
    private func validateTextField(cell: QuestionCell) -> Bool {
        var check = true
        if cell.question.text == "" {
            check = false
            cell.question.placeholder = "Вопрос не указан"
        }
        cell.answers.forEach { (answer) in
            if answer.text == "" {
                check = false
                answer.placeholder = "Ответ не указан"
            }
        }
        return check
    }
}

extension QuestionsViewController: QuestionsViewDelegate{
    func buildQuestions(cells: [QuestionCell]) {
        var check = true
        cells.forEach { (cell) in
            if !validateTextField(cell: cell) {
                check = false
            }
        }
        if check {
            let builder = QuestionsBuilder()
            builder.setQuestions(cells)
            let question = builder.build()
            saveQuestions(questions: question)
        }
    }
}
