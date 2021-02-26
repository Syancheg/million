//
//  SettingsSell.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 22.02.2021.
//

import UIKit

protocol SettingsSellDelegate: class {
    func setDifficulty(difficalty: Difficulty)
}

class SettingsSell: UITableViewCell {
    
    weak var cellDelegate: SettingsSellDelegate?
    
    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var setSwitch: UISwitch!
    
    @IBAction func sortSettings(_ sender: UISwitch) {
        sender.isOn ? cellDelegate?.setDifficulty(difficalty: .random) : cellDelegate?.setDifficulty(difficalty: .sequentially)
    }
}
