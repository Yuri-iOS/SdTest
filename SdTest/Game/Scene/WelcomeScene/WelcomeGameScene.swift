//
//  WelcomeGameScene.swift
//  SdTest
//
//  Created by admin on 15.01.2024.
//

import SpriteKit

class WelcomeGameScene: BaseGameScene {
    var printing = true
    var startGameButton: SKSpriteNode!
    let l = SKShapeNode()
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        createLabels(text: Strings.shared.welcome, delay: 0.02, completion: {
            self.printing = false
        })
        startGameButton = SKSpriteNode(imageNamed: "ship")
        startGameButton.size = CGSize(width: 100, height: 100)
        startGameButton.position = CGPoint(x: frame.midX, y: startGameButton.size.height * 1.3)
        startGameButton.isHidden = printing
        startGameButton.name = "next"
        addChild(startGameButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if touchedNode.name == "next" {
            goToScene(.basicGameScene)
        } else {
            scene?.removeAllActions()
            scene?.children.forEach { c in
                guard let name = c.name else {
                    return
                }
                if name.contains("textNode") {
                    c.isHidden = true
                }
            }
            createLabels(text: Strings.shared.welcome, delay: 0.0005, completion: {
                self.printing = false
            })
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        if !printing {
            startGameButton.isHidden = printing
        }
    }
}
