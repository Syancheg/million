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
protocol GameSessionDelegate: class {
    func updateData(correctAnswer: Int)
}

class GameViewController: UIViewController {
    
    //MARK: - Properties
    
    lazy var contentView = self.view as! GameView
    lazy var game = Game.shared
    let questions = Question.getQuestions
    var scope = 0
    weak var gameDelegate: GameViewControllerDelegate?
    weak var sessionDelegate: GameSessionDelegate?

    //MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = GameSession(questions: questions.count)
        sessionDelegate = session
        game.gameSession = session
        contentView.gameDelegate = self
        startGame()
    }
    
    //MARK: - Game
    
    private func startGame(){
        guard let question = questions.first else {return}
        contentView.questionLabel.text = question.question
        contentView.answerOne.setTitle(question.answers.first, for: .normal)
        contentView.answerTwo.setTitle(question.answers[1], for: .normal)
        contentView.answerThree.setTitle(question.answers[2], for: .normal)
        contentView.answerFour.setTitle(question.answers[3], for: .normal)
        contentView.trueAnswer = question.correctAnswer
        contentView.submitButton.isEnabled = false
    }
    
}

extension GameViewController: GameViewDelegate{
    
    func newQuestion(newIndex: Int) {
        scope += 1
        sessionDelegate?.updateData(correctAnswer: scope)
        if newIndex < questions.count {
            let question = questions[newIndex]
            contentView.questionLabel.text = question.question
            contentView.answerOne.setTitle(question.answers.first, for: .normal)
            contentView.answerTwo.setTitle(question.answers[1], for: .normal)
            contentView.answerThree.setTitle(question.answers[2], for: .normal)
            contentView.answerFour.setTitle(question.answers[3], for: .normal)
            contentView.trueAnswer = question.correctAnswer
            contentView.submitButton.isEnabled = false
        } else {
            contentView.questionLabel.text = "Вы молодец, ответили на все вопросы, возьмите с полки пирожок, но потом верните его обратно"
            contentView.answerOne.removeFromSuperview()
            contentView.answerTwo.removeFromSuperview()
            contentView.answerThree.removeFromSuperview()
            contentView.answerFour.removeFromSuperview()
            stopGame()
        }
    }
    
    func stopGame(){
        game.append()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dismiss(animated: true, completion: nil)
            self.gameDelegate?.printScope(scope: self.scope)
        }
        
    }
}
