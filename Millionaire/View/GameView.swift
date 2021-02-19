//
//  GameView.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 18.02.2021.
//

import UIKit

protocol GameViewDelegate: class {
    func newQuestion(newIndex: Int)
    func stopGame()
}

class GameView: UIView {
    
    
    weak var gameDelegate: GameViewDelegate?
    var answer: Int = -1
    var questionIndex: Int = 0
    var trueAnswer: Int = -1

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    @IBOutlet weak var submitButton: UIButton!

    @IBAction func answerOne(_ sender: UIButton) {
        answer = 0
        selectAnswer(sender: sender)
        activeNextButton()
    }
    @IBAction func answerTwo(_ sender: UIButton) {
        answer = 1
        selectAnswer(sender: sender)
        activeNextButton()
    }
    @IBAction func answerThree(_ sender: UIButton) {
        answer = 2
        selectAnswer(sender: sender)
        activeNextButton()
    }
    @IBAction func answerFour(_ sender: UIButton) {
        answer = 3
        selectAnswer(sender: sender)
        activeNextButton()
    }
    @IBAction func submit(_ sender: UIButton) {
        unSelectedButtons()
        if answer >= 0 {
            if answer == trueAnswer {
                questionIndex += 1
                gameDelegate?.newQuestion(newIndex: questionIndex)
            } else {
                questionLabel.text = "Ответ не верный! Конец игры."
                switch trueAnswer {
                case 0:
                    answerOne.backgroundColor = .green
                case 1:
                    answerTwo.backgroundColor = .green
                case 2:
                    answerThree.backgroundColor = .green
                case 3:
                    answerFour.backgroundColor = .green
                default:
                    break
                }
                gameDelegate?.stopGame()
            }
        }
        
    }
    
    override func awakeFromNib() {
        answerOne.backgroundColor = .lightGray
        answerTwo.backgroundColor = .lightGray
        answerThree.backgroundColor = .lightGray
        answerFour.backgroundColor = .lightGray
        answerOne.tintColor = .white
        answerTwo.tintColor = .white
        answerThree.tintColor = .white
        answerFour.tintColor = .white
        answerOne.layer.cornerRadius = 5
        answerTwo.layer.cornerRadius = 5
        answerThree.layer.cornerRadius = 5
        answerFour.layer.cornerRadius = 5
    }
    
    private func selectAnswer(sender: UIButton){
        unSelectedButtons()
        sender.backgroundColor = .orange
    }
    
    private func unSelectedButtons(){
        answerOne.backgroundColor = .lightGray
        answerTwo.backgroundColor = .lightGray
        answerThree.backgroundColor = .lightGray
        answerFour.backgroundColor = .lightGray
    }
    
    private func activeNextButton(){
        submitButton.isEnabled = true
    }

}
