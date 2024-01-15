//
//  BGSBullet.swift
//  SdTest
//
//  Created by admin on 15.01.2024.
//

import SpriteKit

extension BossGameScene {
    
    func createBossBullet() {
        let bullet = SKSpriteNode(imageNamed: GSConstant.shared.bossBulletImageName)
        bullet.name = GSConstant.shared.bossBulletImageName + "\(Date().millisecondsSince1970)"
        bullet.size = CGSize(width: frame.width * 0.1, height: frame.width * 0.1)
        bullet.position = CGPoint(x: boss.position.x, y: boss.position.y - bullet.size.height / 2)
        bullet.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: GSConstant.shared.bossBulletImageName), size: bullet.size)
        bullet.physicsBody?.categoryBitMask = bossBulletCategory
        bullet.physicsBody?.contactTestBitMask = shipCategory
        bullet.physicsBody?.allowsRotation = false
        addChild(bullet)
        bossBulletList.append(bullet)
    }
    
    func moveBossBullets() {
        bossBulletList.forEach { b in
            b.position.y -= 8
            if b.position.y < -b.size.height {
                b.removeFromParent()
                bossBulletList.removeAll(where: { $0 == b })
            }
        }
    }
    
    func triggerBossBullet(b: SKSpriteNode?) {
        b?.physicsBody?.isDynamic = false
        b?.physicsBody?.categoryBitMask = 32
        b?.texture = SKTexture(imageNamed: GSConstant.shared.exploseImageName)
        b?.speed = 0
        let wait = SKAction.wait(forDuration: 0.3)
        let end = SKAction.run {
            b?.removeFromParent()
        }
        run(SKAction.sequence([wait, end]))
        bossBulletList.removeAll(where: { $0 == b })
        healthCount -= 1
        updateHealthBar {
//            self.finishGame()
        }
    }
    
    func createShipBullet() {
        let bullet = SKSpriteNode(imageNamed: GSConstant.shared.shipBulletImageName)
        bullet.name = GSConstant.shared.shipBulletImageName + "\(Date().millisecondsSince1970)"
        bullet.size = CGSize(width: frame.width * 0.1, height: frame.width * 0.1)
        bullet.position = CGPoint(x: ship.position.x, y: ship.position.y + bullet.size.height / 2)
        bullet.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: GSConstant.shared.shipBulletImageName), size: bullet.size)
        bullet.physicsBody?.categoryBitMask = shipBulletCategory
        bullet.physicsBody?.contactTestBitMask = bossCategory
        bullet.physicsBody?.allowsRotation = false
        addChild(bullet)
        shipBulletList.append(bullet)
    }
    
    func moveShipBullets() {
        shipBulletList.forEach { b in
            b.position.y += 8
            if b.position.y > frame.size.height + b.size.height {
                b.removeFromParent()
                shipBulletList.removeAll(where: { $0 == b })
            }
        }
    }
    
    func triggerShipBullet(b: SKSpriteNode?) {
        b?.physicsBody?.isDynamic = false
        b?.physicsBody?.categoryBitMask = 32
        b?.texture = SKTexture(imageNamed: GSConstant.shared.exploseImageName)
        b?.speed = 0
        let wait = SKAction.wait(forDuration: 0.3)
        let end = SKAction.run {
            b?.removeFromParent()
        }
        run(SKAction.sequence([wait, end]))
        shipBulletList.removeAll(where: { $0 == b })
        bossHealthCount -= 1
        updateBossHealthBar { _ in}
//        updateHealthBar {
////            self.finishGame()
//        }
    }
    
//    func createBullet(
//        name: String,
//        position: CGPoint,
//        categoryBitMask: UInt32,
//        contactTestBitMask: UInt32
//    ) -> SKSpriteNode {
//        let bullet = SKSpriteNode(imageNamed: name)
//        bullet.name = name + "\(Date().millisecondsSince1970)"
//        bullet.size = CGSize(width: frame.width * 0.1, height: frame.width * 0.1)
//        bullet.position = position
//        bullet.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: name), size: bullet.size)
//        bullet.physicsBody?.categoryBitMask = categoryBitMask
//        bullet.physicsBody?.contactTestBitMask = contactTestBitMask
//        bullet.physicsBody?.allowsRotation = false
//        return bullet
//    }
}
