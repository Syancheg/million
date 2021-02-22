//
//  Game.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 19.02.2021.
//

import UIKit

class Game {
    var gameSession: GameSession?
    private let recordsCaretaker = RecordsCaretaker()
    private(set) var games: [GameSession] = [] {
        didSet {
                recordsCaretaker.save(gameSessions: self.games)
            }
    }
    static let shared = Game()
    private init() {
        self.games = self.recordsCaretaker.retrieveRecords()
    }
    
    func append(){
        guard let session = gameSession else {
            return
        }
        let percent = (Float(session.countCorrectAnswer) / Float(session.countQuestions)) * 100
        session.percent = Int(percent)
        games.append(session)
        gameSession = nil
    }
}
