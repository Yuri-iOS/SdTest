//
//  GSX2Score.swift
//  SdTest
//
//  Created by admin on 12.01.2024.
//

import SpriteKit

extension BasicGameScene {
    
    func createX2Field() {
        if Int.random(in: 0...900) != 0 {
            return
        }
        if x2Field == nil {
            x2Field = createObstacleObject(imageName: GSConstant.shared.x2ImageName, name: GSConstant.shared.x2Name, size: CGSize(width: frame.width * 0.2, height: frame.width * 0.2), category: x2Category, contactBitMask: shipCategory, speed: CGFloat.random(in: 3.5...6.9))
            addChild(x2Field ?? SKSpriteNode())
        } else {
            return
        }
    }
    
    func moveX2Field() {
        guard let x2 = x2Field else {
            return
        }
        x2.position.y -= x2.speed
        if x2.position.y <= -x2.size.height {
            x2Field = nil
        }
    }
    
    func triggerX2Field() {
        currentScore *= 2
        scoreLabel.text = "\(currentScore)"
    }
}
