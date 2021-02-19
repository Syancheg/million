//
//  RecordTableViewController.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 19.02.2021.
//

import UIKit

class RecordTableViewController: UITableViewController {

    var games = Game.shared.games
    
    override func viewDidLoad() {
        super.viewDidLoad()
        games.reverse()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCellTableViewCell", for: indexPath) as! RecordCellTableViewCell
        let result = games[indexPath.row]
        cell.scopeLabel.text = "Количество очков — \(result.countScope), правильных ответов \(result.percent)%"
        return cell
    }

}
