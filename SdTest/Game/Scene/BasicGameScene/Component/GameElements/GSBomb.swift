//
//  GSBomb.swift
//  SdTest
//
//  Created by admin on 11.01.2024.
//

import SpriteKit

extension BasicGameScene {
    
    func createBombField() {
        if Int.random(in: 0...100) != 0 {
            return
        }
        if bombField == nil {
            bombField = createObstacleObject(imageName: GSConstant.shared.bombImageName, name: GSConstant.shared.bombName, size: CGSize(width: frame.width * 0.2, height: frame.width * 0.2), category: bombCategory, contactBitMask: shipCategory, speed: CGFloat.random(in: 3.5...6.9))
            addChild(bombField ?? SKSpriteNode())
        } else {
            return
        }
    }
    
    func moveBombField() {
        guard let bomb = bombField else {
            return
        }
        bomb.position.y -= bomb.speed
        if bomb.position.y <= -bomb.size.height {
            bombField = nil
        }
    }
    
    func triggerBomb() {
        asteroidList.forEach { a in
            a.physicsBody?.isDynamic = false
            a.physicsBody?.categoryBitMask = 32
            a.texture = SKTexture(imageNamed: GSConstant.shared.exploseImageName)
            a.speed = 0
            let wait = SKAction.wait(forDuration: 0.3)
            let end = SKAction.run {
                a.removeFromParent()
            }
            run(SKAction.sequence([wait, end]))
            asteroidList.removeAll(where: { $0 == a })
        }
        var size = 100
        let circle = SKSpriteNode(imageNamed: "circle")
//        circle.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size, height: size), cornerRadius: 100).cgPath
        circle.position = ship.position
        circle.size = CGSize(width: 10, height: 10)
        addChild(circle)
        let start = SKAction.scale(to: frame.size.height / 2, duration: 1.3)
        let end = SKAction.run {
            circle.removeFromParent()
        }
        circle.run(SKAction.sequence([start, end]))
    }
}
