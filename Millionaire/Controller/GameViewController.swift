//
//  GameViewController.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 18.02.2021.
//

import UIKit

protocol GameViewControllerDelegate: class {
    func printScope(scope: Int)
}
protocol GameViewControllerSessionDelegate: class {
    func updateData(correctAnswer: Int)
}

class GameViewController: UIViewController {
    
    //MARK: - Properties
    
    lazy var contentView = self.view as! GameView
    lazy var game = Game.shared
    var questions: [Question] = []
    var currentIssue: Question?
    var indexCurrentIssue: Int?
    var scope = Observable<Int>(0)
    weak var gameDelegate: GameViewControllerDelegate?
    weak var sessionDelegate: GameViewControllerSessionDelegate?
    var gameStrategy: GameStrategy?
    
    //MARK: - Controller Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let strategy = gameStrategy else { return }
        questions = strategy.sortArray(array: Question.getQuestions)
        let session = GameSession(questions: questions.count)
        sessionDelegate = session
        scope.addObserver(self, options: [.initial, .new]) { [weak self] (scope, _) in
            let percent = (Float(scope) / Float(self?.questions.count ?? 0)) * 100
            self?.contentView.resultLabel.text = "Вопрос №\(scope), прогресс — \(Int(percent))%"
        }
        game.gameSession = session
        contentView.gameDelegate = self
        
        startGame()
    }
    
    //MARK: - Game Life Circle
    
    private func startGame(){
        contentView.unSelectedButtons()
        if (indexCurrentIssue == nil) {
            guard let question = questions.first else {return}
            displayQuestion(question: question)
            indexCurrentIssue = 0
        } else {
            indexCurrentIssue! += 1
            if questions.count > indexCurrentIssue!{
                let question = questions[indexCurrentIssue!]
                displayQuestion(question: question)
            } else {
                winGame()
            }
        }
        
    }
    
    private func winGame(){
        sessionDelegate?.updateData(correctAnswer: scope.value)
        contentView.questionLabel.text = "Вы молодец, ответили на все вопросы, возьмите с полки пирожок, но потом верните его обратно"
        game.append()
        contentView.disabledButtons()
        returnMainMenu()
    }
    
    private func overGame(){
        gameDelegate?.printScope(scope: scope.value)
        contentView.selectCorrectAnswer(index: currentIssue!.correctAnswer)
        contentView.questionLabel.text = "Вы ошиблись, игра окончена!"
        sessionDelegate?.updateData(correctAnswer: scope.value)
        game.append()
        contentView.disabledButtons()
        returnMainMenu()
    }
    
    private func displayQuestion(question: Question){
        currentIssue = question
        contentView.questionLabel.text = question.question
        contentView.answerButtons.enumerated().forEach { (index, button) in
            button.setTitle(question.answers[index], for: .normal)
        }
        contentView.submitButton.isEnabled = false
    }
    
    //MARK: - return maint menu
    
    private func returnMainMenu(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension GameViewController: GameViewDelegate{
    func newAnswer(tag: Int) {
        guard let correctAnswer = currentIssue?.correctAnswer else { return }
        if correctAnswer == tag {
            scope.value += 1
            startGame()
        } else {
            overGame()
        }
    }
}
