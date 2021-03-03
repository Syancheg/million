//
//  MainView.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 18.02.2021.
//

import UIKit

class MainView: UIView {

    @IBOutlet weak var scopeLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var scopeTableButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var addQuestions: UIButton!
    

    override func awakeFromNib() {
        newGameButton.layer.cornerRadius = 5
        scopeTableButton.layer.cornerRadius = 5
        settingsButton.layer.cornerRadius = 5
        addQuestions.layer.cornerRadius = 5
        scopeTableButton.titleLabel?.adjustsFontSizeToFitWidth = true;
        newGameButton.titleLabel?.adjustsFontSizeToFitWidth = true;
        settingsButton.titleLabel?.adjustsFontSizeToFitWidth = true;
        addQuestions.titleLabel?.adjustsFontSizeToFitWidth = true;
    }
    
}
