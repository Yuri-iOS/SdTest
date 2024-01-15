//
//  GSHeart.swift
//  SdTest
//
//  Created by admin on 11.01.2024.
//

import SpriteKit

extension BasicGameScene {
    
    func createHeartField() {
        if Int.random(in: 0...100) != 0 {
            return
        }
        if heartField == nil {
            heartField = createObstacleObject(imageName: GSConstant.shared.heartImageName, name: GSConstant.shared.heartName, size: CGSize(width: frame.width * 0.2, height: frame.width * 0.2), category: heartCategory, contactBitMask: shipCategory, speed: CGFloat.random(in: 3.5...6.9), allowsRotation: false)
            addChild(heartField ?? SKSpriteNode())
        } else {
            return
        }
    }
    
    func moveHeartField() {
        guard let heart = heartField else {
            return
        }
        heart.position.y -= heart.speed
        if heart.position.y <= -heart.size.height {
            heartField = nil
        }
    }
    
    func triggerHeart() {
        if healthCount < 10 {
            healthCount += 1
            updateHealthBar {}
        }
        return
    }
}
