//
//  GSScore.swift
//  SdTest
//
//  Created by admin on 12.01.2024.
//

import SpriteKit

extension BasicGameScene {
    func setupScoreLabel() {
        if scoreLabel != nil {
            scoreLabel.removeFromParent()
            scoreLabel = nil
        }
        scoreLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
        scoreLabel.text = "\(currentScore)"
        scoreLabel.fontColor = .white
        scoreLabel.position = CGPoint(x: frame.size.width / 2, y: frame.size.height * 0.89)
        addChild(scoreLabel)
    }
    
    func calculateScore() {
        scoreDamp += 1
        if scoreDamp >= 10 {
            currentScore += 1
            scoreDamp = 0
            scoreLabel.text = "\(currentScore)"
        }
    }
}
