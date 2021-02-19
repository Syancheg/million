//
//  MainViewController.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 18.02.2021.
//

import UIKit

class MainViewController: UIViewController {

    lazy var contentView = self.view as! MainView

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? GameViewController else { return }
        destination.gameDelegate = self
    }

}

extension MainViewController: GameViewControllerDelegate {
    func printScope(scope: Int) {
        self.contentView.scopeLabel.text = "Счет: \(scope)"
    }
}
