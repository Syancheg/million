//
//  QuestionCell.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 22.02.2021.
//

import UIKit

class QuestionCell: UITableViewCell {
    
    @IBOutlet weak var question: UITextField!
    @IBOutlet var answers: [UITextField]!
    @IBOutlet weak var correctAnswer: UISegmentedControl!

}
