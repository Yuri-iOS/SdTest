//
//  BLGameScene.swift
//  SdTest
//
//  Created by admin on 15.01.2024.
//

import SpriteKit
import UIKit

class BossGameScene: BaseGameScene {
    
    enum HBossDirection {
        case left, right
        
        static func random() -> Self {
            return Int.random(in: 0...1) == 0 ? .left : .right
        }
    }
    
    enum VBossDirection {
        case up, down
        
        static func random() -> Self {
            return Int.random(in: 0...1) == 0 ? .up : .down
        }
    }
    
    var boss: SKSpriteNode!
    var bossHealthCount = 20
    var bossHealthBar: SKShapeNode!
    var bossBulletsList: [SKSpriteNode] = []
    var bossX = 0.0
    var bossY = 0.0
    var bossHDir = HBossDirection.random()
    var bossVDir = VBossDirection.random()
    var bossSpeed = 5.0
    var bulletLastTime = 0.0
    

    let bossCategory: UInt32 = 2
    let shipBulletCategory: UInt32 = 3
    let bossBulletCategory: UInt32 = 4
    
    var bossBulletList: [SKSpriteNode] = []
    var shipBulletList: [SKSpriteNode] = []
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = .zero
        setupBoss()
        setupShip(contactTestBitMask: bossBulletCategory)
        setupHealthBar()
        setupBossHealthBar()
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        moveBoss()
        moveShip()
        let lt = Double(round(10 * currentTime) / 10)
        let t = Int(currentTime)
        if lt > bulletLastTime {
            if Int(lt * 10) % 5 == 0 {
                bulletLastTime = lt
                createBossBullet()
                createShipBullet()
            }
            
        }
        moveBossBullets()
        moveShipBullets()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        shipMoveState = .none
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        switch touchedNode.name {
        default:
            if positionInScene.x >= frame.midX {
                shipMoveState = .right
            } else {
                shipMoveState = .left
            }
        }
    }
    
    override func didFinishUpdate() {
        super.didFinishUpdate()
    }
    
    func setupBoss() {
        
        boss = SKSpriteNode(imageNamed: GSConstant.shared.bossImageName)
        boss.name = GSConstant.shared.bossImageName
        boss.size = CGSize(width: frame.midX * 0.5, height: frame.midX * 0.5)
        bossX = random(min: boss.size.width / 2, max: size.width - boss.size.width / 2)
        bossY = random(min: frame.midY + boss.size.height / 2, max: size.height - boss.size.height / 2)
        boss.position = CGPoint(x: bossX, y: bossY)
        boss.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: GSConstant.shared.bossImageName), size: boss.size)
        boss.physicsBody?.categoryBitMask = bossCategory
        boss.physicsBody?.contactTestBitMask = shipBulletCategory
        boss.physicsBody?.isDynamic = false
        
        addChild(boss)
    }
    
    func moveBoss(_ withChaos: Bool = true) {
        switch bossHDir {
        case .left:
            if boss.position.x > boss.size.width / 2 {
                boss.position.x -= bossSpeed
                bossHealthBar.position.x = boss.position.x - boss.size.width / 2
                if Int.random(in: 0...66) == 0 && withChaos {
                    bossHDir = .right
                }
                moveBossVertical(withChaos)
            } else {
                bossHDir = .right
            }
            
        case .right:
            if boss.position.x < size.width - boss.size.width / 2 {
                boss.position.x += bossSpeed
                bossHealthBar.position.x = boss.position.x - boss.size.width / 2
                if Int.random(in: 0...66) == 0 && withChaos {
                    bossHDir = .left
                }
                moveBossVertical(withChaos)
            } else {
                bossHDir = .left
            }
        }
    }
    
    func moveBossVertical(_ withChaos: Bool) {
        switch bossVDir {
        case .up:
            if boss.position.y < size.height - boss.size.height / 2 {
                boss.position.y += bossSpeed
                bossHealthBar.position.y = boss.position.y + boss.size.height * 0.6
                if Int.random(in: 0...66) == 0 && withChaos {
                    bossVDir = .down
                }
            } else {
                bossVDir = .down
            }
        case .down:
            if boss.position.y > frame.midY + boss.size.height / 2 {
                boss.position.y -= bossSpeed
                bossHealthBar.position.y = boss.position.y + boss.size.height * 0.6
                if Int.random(in: 0...66) == 0 && withChaos {
                    bossVDir = .up
                }
            } else {
                bossVDir = .up
            }
        }
    }
}
