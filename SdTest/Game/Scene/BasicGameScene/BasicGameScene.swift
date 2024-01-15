//
//  GameScene.swift
//  SdTest
//
//  Created by admin on 09.01.2024.
//

import SpriteKit
import UIKit

class BasicGameScene: BaseGameScene {
    
    //ui fields
    var scoreDamp = 0
    var currentScore = 0
    var scoreLabel: SKLabelNode!
    
    //ship fields
    
    //mask category
    let asteroidCategory: UInt32 = 2
    let wallsCategory: UInt32 = 3
    let shieldCategory: UInt32 = 4
    let bombCategory: UInt32 = 5
    let heartCategory: UInt32 = 6
    let reducerCategory: UInt32 = 7
    let x2Category: UInt32 = 8
    
    //shield fields
    var shieldTimeLeft = 0
    var hasShield = false
    var shieldField: SKSpriteNode? = nil
    
    //asteroid fields
    var asteroidList: [SKSpriteNode] = []
    
    //health fields
    
    //bomb fields
    var bombField: SKSpriteNode? = nil
    
    //heart fields
    var heartField: SKSpriteNode? = nil
    
    //reducer fields
    var reducerTimeLeft = 0
    var hasReducer = false
    var reducerField: SKSpriteNode? = nil
    
    //x2 field
    var x2Field: SKSpriteNode? = nil
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = .zero
        setupShip(contactTestBitMask: asteroidCategory)
        setupHealthBar()
        setupScoreLabel()
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        shipMoveState = .none
    }
    
    override func didFinishUpdate() {
        super.didFinishUpdate()
        setupScoreLabel()
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        moveShip()
        if hasShield {
            checkShield()
        }
        if hasReducer {
            checkReducer()
        }
        createAsteroid()
        moveAsteroids()
        createShieldField()
        moveShieldField()
        createBombField()
        moveBombField()
        createHeartField()
        moveHeartField()
        createReducerField()
        moveReducerField()
        createX2Field()
        moveX2Field()
        calculateScore()
    }
    

    

    
    func finishGame() {
        self.ship.texture = SKTexture(imageNamed: GSConstant.shared.exploseImageName)
        self.ship.physicsBody?.isDynamic = true
        self.ship.physicsBody?.categoryBitMask = 45
        healthBar.isHidden = true
        let wait = SKAction.wait(forDuration: 1)
        let done = SKAction.run { [self] in
            //            self.navigationController?.popViewController(animated: false)
            let scene = BossGameScene()
            scene.size = size
            scene.scaleMode = scaleMode
            view?.presentScene(scene)
        }
        run(SKAction.sequence([wait, done]))
        
    }
    
    func createObstacleObject(
        imageName: String,
        name: String,
        size: CGSize,
        category: UInt32,
        contactBitMask: UInt32,
        speed: CGFloat,
        allowsRotation: Bool = true
    ) -> SKSpriteNode {
        let object = SKSpriteNode(imageNamed: imageName)
        object.name = name + "\(Date().millisecondsSince1970)"
        object.size = size
        let x = random(min: object.size.width / 2, max: frame.size.width - object.size.width / 2)
        object.position = CGPoint(x: x, y: frame.size.height + object.size.height / 2)
        object.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: imageName), size: object.size)
        object.physicsBody?.categoryBitMask = category
        object.physicsBody?.contactTestBitMask = contactBitMask
        object.speed = speed
        object.physicsBody?.allowsRotation = allowsRotation
        return object
    }
}
