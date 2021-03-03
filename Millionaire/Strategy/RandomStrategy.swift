//
//  RandomStrategy.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 22.02.2021.
//

import UIKit

class RandomStrategy: GameStrategy {
    func sortArray(array: [Question]) -> [Question] {
        return array.shuffled()
    }
}
