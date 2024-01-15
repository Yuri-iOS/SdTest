//
//  Ship.swift
//  SdTest
//
//  Created by admin on 15.01.2024.
//

import SpriteKit

extension BaseGameScene {
    func setupShip(contactTestBitMask: UInt32) {
        shipX = frame.midX
        ship = SKSpriteNode(imageNamed: GSConstant.shared.shipImageName)
        ship.name = GSConstant.shared.shipName
        ship.size = CGSize(width: frame.width * 0.3, height: frame.width * 0.3)
        ship.position = CGPoint(x: shipX, y: frame.midY * 0.5)
        ship.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: GSConstant.shared.shipImageName), size: ship.size)
        ship.physicsBody?.categoryBitMask = shipCategory
        ship.physicsBody?.contactTestBitMask = contactTestBitMask
        ship.physicsBody?.isDynamic = false
        addChild(ship)
    }
    
    func moveShip() {
        if shipMoveState == .none {
            return
        }
        if shipMoveState == .left {
            if shipX > ship.size.width * 0.5 {
                shipX -= shipSpeed
                ship.position.x = shipX
            }
        }
        
        if shipMoveState == .right {
            if shipX < frame.width - ship.size.width * 0.5 {
                shipX += shipSpeed
                ship.position.x = shipX
            }
        }
    }
}
