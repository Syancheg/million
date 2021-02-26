//
//  GameStrategy.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 22.02.2021.
//

import UIKit

protocol GameStrategy: class {

    func sortArray(array: [Question]) -> [Question]
    
}
