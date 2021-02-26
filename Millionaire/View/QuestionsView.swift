//
//  QuestionsView.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 22.02.2021.
//

import UIKit

protocol QuestionsViewDelegate: class {
    func buildQuestions(cells: [QuestionCell])
}

class QuestionsView: UIView, UITabBarDelegate, UITableViewDataSource {
    
    weak var delegate: QuestionsViewDelegate?
    private var countCells = 1
    private var cells: [QuestionCell] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addQuestionsTapped(_ sender: UIButton) {
        delegate?.buildQuestions(cells: cells)
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        countCells += 1
        cells = []
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        cells.append(cell)
        return cell
    }
}
