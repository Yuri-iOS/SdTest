//
//  GSAsteroid.swift
//  SdTest
//
//  Created by admin on 10.01.2024.
//

import SpriteKit

extension BasicGameScene {
    
    func createAsteroid() {
        if Int.random(in: 0...25) != 0 {
            return
        }
        let size = frame.width * CGFloat.random(in: 0.1...0.27)
        let asteroid = SKSpriteNode(imageNamed: GSConstant.shared.asteroidImageName)
        asteroid.name = GSConstant.shared.asteroidName + "\(Date().millisecondsSince1970)"
        asteroid.size = CGSize(width: size, height: size)
        let asteroidActualX = random(min: asteroid.size.width / 2, max: frame.size.width - asteroid.size.width / 2)
        asteroid.position = CGPoint(x: asteroidActualX, y: frame.size.height + asteroid.size.height)
        asteroid.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: GSConstant.shared.asteroidImageName), size: asteroid.size)
        asteroid.physicsBody?.categoryBitMask = asteroidCategory
        asteroid.physicsBody?.contactTestBitMask = shipCategory
        asteroid.speed = CGFloat.random(in: 2.6...5.5)
        addChild(asteroid)
        asteroidList.append(asteroid)
    }
    
    
    func moveAsteroids() {
        asteroidList.forEach { i in
            i.position.y -= i.speed
            if i.position.y <= -i.size.height {
                i.removeFromParent()
                asteroidList.removeAll(where: { $0 == i })
            }
        }
    }
    
    func triggerAsteroid(a: SKSpriteNode?) {
        a?.physicsBody?.isDynamic = false
        a?.physicsBody?.categoryBitMask = 32
        a?.texture = SKTexture(imageNamed: GSConstant.shared.exploseImageName)
        a?.speed = 0
        let wait = SKAction.wait(forDuration: 0.3)
        let end = SKAction.run {
            a?.removeFromParent()
        }
        run(SKAction.sequence([wait, end]))
        asteroidList.removeAll(where: { $0 == a })
        healthCount -= hasReducer ? 2 : 1
        updateHealthBar {
            self.finishGame()
        }
    }
}
