//
//  Background.swift
//  SdTest
//
//  Created by admin on 15.01.2024.
//

import SpriteKit

extension BaseGameScene {
    func setupBackground() {
        backImageStartY = frame.midY
        backImage0 = SKSpriteNode(imageNamed: GSConstant.shared.backImageName)
        backImage0.name = GSConstant.shared.back0Name
        backImage0.size = CGSize(width: frame.width, height: frame.height)
        backImage0.position = CGPoint(x: frame.midX, y: backImageStartY)
        backImageEndY = frame.height * 1.5
        backImage1 = SKSpriteNode(imageNamed: GSConstant.shared.backImageName)
        backImage1.name = GSConstant.shared.back1Name
        backImage1.size = CGSize(width: frame.width, height: frame.height)
        backImage1.position = CGPoint(x: frame.midX, y: backImageEndY)
        addChild(backImage0)
        addChild(backImage1)
    }
    
    func moveBackground() {
        if backImageStartY <= -frame.midY {
            backImageStartY = frame.height * 1.5
            backImage0.position.y = backImageStartY
        }
        if backImageEndY <= -frame.midY {
            backImageEndY = frame.height * 1.5
            backImage1.position.y = backImageEndY
        }
        
        backImageStartY -= backSpeed
        backImageEndY -= backSpeed
        backImage0.position.y = backImageStartY
        backImage1.position.y = backImageEndY
    }
}
