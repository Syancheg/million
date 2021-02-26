//
//  GameView.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 18.02.2021.
//

import UIKit

protocol GameViewDelegate: class {
    func newAnswer(tag: Int)
}

class GameView: UIView {
    
    weak var gameDelegate: GameViewDelegate?
    var userAnswer: Int?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet var answerButtons: [UIButton]!
    
    
    @IBAction func submit(_ sender: UIButton) {
        guard let answer = userAnswer else { return }
        gameDelegate?.newAnswer(tag: answer)
    }
    
    func disabledButtons(){
        answerButtons.forEach { (answerButton) in
            answerButton.isEnabled = false
        }
    }
    
    func selectCorrectAnswer(index: Int){
        answerButtons[index].backgroundColor = .purple
    }
    
    func unSelectedButtons(){
        answerButtons.forEach { (answerButton) in
            answerButton.backgroundColor = .lightGray
        }
    }
    
    override func awakeFromNib() {
        answerButtons.forEach { (answerButton) in
            answerButton.backgroundColor = .lightGray
            answerButton.tintColor = .white
            answerButton.layer.cornerRadius = 5
            answerButton.addTarget(self, action: #selector(answerTapped), for: .touchUpInside)
        }
    }
    
    @objc func answerTapped(_ sender: UIButton){
        unSelectedButtons()
        sender.backgroundColor = .orange
        submitButton.isEnabled = true
        userAnswer = sender.tag
    }

}
