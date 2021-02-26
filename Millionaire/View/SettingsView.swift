//
//  SettingsView.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 22.02.2021.
//

import UIKit

class SettingsView: UIView,  UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var difficaltyNow: Difficulty = .sequentially
    var forDelegate: SettingsSellDelegate?

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsSell", for: indexPath) as! SettingsSell
        guard let VC = forDelegate else  {
            return cell
        }
        cell.cellDelegate = VC
        switch difficaltyNow {
        case .sequentially:
            cell.setSwitch.isOn = false
        case .random:
            cell.setSwitch.isOn = true
        }
        cell.settingsLabel.text = "Настройки сортировки"
        return cell
    }
    


}
