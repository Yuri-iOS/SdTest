//
//  ViewController.swift
//  SdTest
//
//  Created by admin on 09.01.2024.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    private var button: UIButton!
    
    private var startGameButton: UIButton!
    private var settingsButton: UIButton!

    override func viewDidLoad() {
        view.backgroundColor = .blue
        let button = UIButton()
        button.backgroundColor = .cyan
        button.setTitle("game", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.frame = CGRect(x: view.frame.midX - 50, y: view.frame.midY - 50, width: 100, height: 100)
        button.addTarget(self, action: #selector(toGame), for: .touchUpInside)
        view.addSubview(button)
        let constraints = [
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 2),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),÷÷÷
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //right
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            //height
            button.heightAnchor.constraint(equalToConstant: 100)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func toGame() {
        let gameViewController = GameViewController()
        self.navigationController?.pushViewController(gameViewController, animated: false)
    }
    
    private func setupStartGameButton() {
        startGameButton = UIButton()
        startGameButton.backgroundColor = .cyan
        startGameButton.setTitle("game", for: .normal)
        startGameButton.setTitleColor(.black, for: .normal)
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        startGameButton.addTarget(self, action: #selector(toGame), for: .touchUpInside)
        view.addSubview(startGameButton)
    }
    
    private func setupConstraints() {
        
    }
}

