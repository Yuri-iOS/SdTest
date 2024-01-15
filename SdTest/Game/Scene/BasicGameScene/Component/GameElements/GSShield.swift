//
//  GSShield.swift
//  SdTest
//
//  Created by admin on 10.01.2024.
//

import SpriteKit

extension BasicGameScene {
    
    func createShieldField() {
        if hasShield || hasReducer {
            return
        }
        if Int.random(in: 0...400) != 0 {
            return
        }
        if shieldField == nil {
            shieldField = createObstacleObject(imageName: GSConstant.shared.shieldImageName, name: GSConstant.shared.shipName, size: CGSize(width: frame.width * 0.2, height: frame.width * 0.2), category: shieldCategory, contactBitMask: shipCategory, speed: CGFloat.random(in: 3.5...6.9), allowsRotation: false)
            addChild(shieldField ?? SKSpriteNode())
        } else {
            return
        }
    }
    
    func moveShieldField() {
        guard let shield = shieldField else {
            return
        }
        shield.position.y -= shield.speed
        if shield.position.y <= -shield.size.height {
            shieldField = nil
        }
    }
    
    func checkShield() {
        shieldTimeLeft -= 1
        if shieldTimeLeft == 30 {
            setRegularShip()
        }
        if shieldTimeLeft == 15 {
            setShieldShip()
        }
        if shieldTimeLeft <= 0 {
            setRegularShip()
            shieldTimeLeft = 0
            hasShield = false
        }
    }
    
    func setupShield() {
        shieldTimeLeft = 300
        hasShield = true
        setShieldShip()
    }
    
    func setShieldShip() {
        ship.texture = SKTexture(imageNamed: GSConstant.shared.shipWithShieldImageName)
    }
    
    func setRegularShip() {
        ship.texture = SKTexture(imageNamed: GSConstant.shared.shipImageName)
    }
}
