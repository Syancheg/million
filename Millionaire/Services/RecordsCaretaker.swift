//
//  RecordsCaretaker.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 19.02.2021.
//

import UIKit

final class RecordsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "records"
    
    func save(gameSessions: [GameSession]) {
        do {
            let data = try self.encoder.encode(gameSessions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
