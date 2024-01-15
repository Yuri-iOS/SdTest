//
//  BaseGameScene.swift
//  SdTest
//
//  Created by admin on 15.01.2024.
//

import SpriteKit
import UIKit

class BaseGameScene: SKScene {
    
    var navigationController: UINavigationController? = nil
    
    var backButton: SKSpriteNode!
    
    var backImage0: SKSpriteNode!
    var backImage1: SKSpriteNode!
    var backImageStartY: Double!
    var backImageEndY: Double!
    let backSpeed = GSConstant.shared.backSpeed
    var nodes: [SKLabelNode] = []
    
    var ship: SKSpriteNode!
    var shipX: Double!
    var shipMoveState: ShipMoveState = .none
    var shipSpeed = GSConstant.shared.shipSpeed
    
    let shipCategory: UInt32 = 1
    
    var healthCount = 10
    var healthBar: SKShapeNode!
    
    enum ShipMoveState {
        case none, left, right
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupBackground()
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        moveBackground()
    }
    
    override func didFinishUpdate() {
        super.didFinishUpdate()
        setupBackButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if touchedNode.name == GSConstant.shared.backButtonName {
            navigationController?.popViewController(animated: false)
        }
    }
    

    
    func setupBackButton() {
        if backButton != nil {
            backButton.removeFromParent()
            backButton = nil
        }
        backButton = SKSpriteNode(imageNamed: GSConstant.shared.backButtonImageName)
        backButton.name = GSConstant.shared.backButtonName
        backButton.size = CGSize(width: frame.width * 0.1, height: frame.width * 0.1)
        backButton.position = CGPoint(x: backButton.size.width, y: frame.size.height * 0.91)
        addChild(backButton)
    }
    
    func goToScene(_ s: SceneType) {
        let sceneToLoad: SKScene? = StorageManager.shared.getSceneType(s)
        if let scene = sceneToLoad {
            scene.size = size
            scene.scaleMode = scaleMode
            StorageManager.shared.setScene(s)
            self.view?.presentScene(scene)
        }
    }
    
    func createLabels(text: String, maxLineWidth: Int = 50, delay: TimeInterval, completion: @escaping () -> Void) {
        let count = text.count
        var counter = -1
        var lastY = frame.maxY * 0.8
        var outText = ""
        
        let lines = Int((CGFloat(count) / CGFloat(maxLineWidth)).rounded(.up))
        var nodes = [SKLabelNode](repeating: SKLabelNode(), count: lines)
        var currentNodeIndex = 0
        var actions: [SKAction] = []
        text.forEach { s in
            if (counter >= maxLineWidth && String(s) == " ") || counter == -1 {
                counter = 0
                let start = SKAction.run {
                    outText = ""
                    outText += String(s)
                    nodes[currentNodeIndex] = SKLabelNode()
                    nodes[currentNodeIndex].name = "textNode\(UUID().uuidString)"
                    nodes[currentNodeIndex].color = .white
                    nodes[currentNodeIndex].fontSize = 12
                    nodes[currentNodeIndex].fontName = "AvenirNext-Bold"
                    nodes[currentNodeIndex].position = CGPoint(x: self.frame.midX, y: lastY)
                    nodes[currentNodeIndex].text = outText
                    lastY -= 40
                    self.addChild(nodes[currentNodeIndex])
                }
                let wait = String(s) == " " ? SKAction.run {} : SKAction.wait(forDuration: delay)
                actions += [start, wait]
                if currentNodeIndex < lines - 1 {
                    currentNodeIndex += 1
                }
            } else {
                counter += 1
                let start = SKAction.run {
                    
                    outText += String(s)
                    nodes[currentNodeIndex].text = outText
                }
                let wait = String(s) == " " ? SKAction.run {} : SKAction.wait(forDuration: delay)
                actions += [start, wait]
            }

        }
        let completion = SKAction.run {
            completion()
        }
        run(SKAction.sequence(actions + [completion]))
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat(Float(arc4random()) / 4294967296) * (max - min) + min
    }
    
    func toRad(_ deg: CGFloat) -> CGFloat {
        deg * .pi / 180
    }
    

    

}
