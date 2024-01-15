//
//  ContactDelegate.swift
//  SdTest
//
//  Created by admin on 09.01.2024.
//

import SpriteKit

extension BasicGameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        contactShipWithAsteroid(contact)
        contactShipWithShield(contact)
        contactShipWithBomb(contact)
        contactShipWithHeart(contact)
        contactShipWithReducer(contact)
        contactShipWithX2(contact)
    }
    
    func contactShip(_ contact: SKPhysicsContact, category: UInt32, action: @escaping () -> Void) {
        if (contact.bodyA.categoryBitMask == category && contact.bodyB.categoryBitMask == shipCategory) || (contact.bodyA.categoryBitMask == shipCategory && contact.bodyB.categoryBitMask == category) {
            action()
        }
    }
    
    func contactShipWithAsteroid(_ contact: SKPhysicsContact) {
        if !hasShield {
            if (contact.bodyA.categoryBitMask == asteroidCategory && contact.bodyB.categoryBitMask == shipCategory) || (contact.bodyA.categoryBitMask == shipCategory && contact.bodyB.categoryBitMask == asteroidCategory) {
                
                if contact.bodyA.categoryBitMask == asteroidCategory || contact.bodyB.categoryBitMask == asteroidCategory {
                    var name = ""
                    if contact.bodyA.node?.name != GSConstant.shared.shipName {
                        name = contact.bodyA.node?.name ?? ""
                    } else if contact.bodyB.node?.name != GSConstant.shared.shipName {
                        name = contact.bodyB.node?.name ?? ""
                    }
                    let asteroid = asteroidList.filter({ $0.name == name}).first
                    triggerAsteroid(a: asteroid)
                }
            }
        }
    }
    
    func contactShipWithShield(_ contact: SKPhysicsContact) {
        contactShip(contact, category: shieldCategory) {
            self.shieldField?.removeFromParent()
            self.shieldField = nil
            self.setupShield()
        }
    }
    
    func contactShipWithBomb(_ contact: SKPhysicsContact) {
        contactShip(contact, category: bombCategory) {
            self.bombField?.removeFromParent()
            self.bombField = nil
            self.triggerBomb()
        }
    }
    
    func contactShipWithHeart(_ contact: SKPhysicsContact) {
        contactShip(contact, category: heartCategory) {
            self.heartField?.physicsBody?.categoryBitMask = 101
            self.heartField?.removeFromParent()
            self.heartField = nil
            self.triggerHeart()
        }
    }
    
    func contactShipWithReducer(_ contact: SKPhysicsContact) {
        contactShip(contact, category: reducerCategory) {
            self.reducerField?.removeFromParent()
            self.reducerField = nil
            self.setupReducer()
        }
    }
    
    func contactShipWithX2(_ contact: SKPhysicsContact) {
        contactShip(contact, category: x2Category) {
            self.x2Field?.removeFromParent()
            self.x2Field = nil
            self.triggerX2Field()
        }
    }
}


