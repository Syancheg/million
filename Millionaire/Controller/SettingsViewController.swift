//
//  SettingsViewController.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 22.02.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    lazy var contentView = self.view as! SettingsView
    lazy var game = Game.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.difficaltyNow = game.difficulty
        contentView.forDelegate = self
        title = "Настройки игры"
    }
}

extension SettingsViewController: SettingsSellDelegate {
    func setDifficulty(difficalty: Difficulty) {
        game.difficulty = difficalty
    }
}
