//
//  BGSContactDelegate.swift
//  SdTest
//
//  Created by admin on 15.01.2024.
//

import SpriteKit

extension BossGameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        contactShipWithBossBullet(contact)
        contactBossWithShipBullet(contact)
    }
    
    func contactShip(_ contact: SKPhysicsContact, category: UInt32, action: @escaping () -> Void) {
        if (contact.bodyA.categoryBitMask == category && contact.bodyB.categoryBitMask == shipCategory) || (contact.bodyA.categoryBitMask == shipCategory && contact.bodyB.categoryBitMask == category) {
            action()
        }
    }
    
    func contactShipWithBossBullet(_ contact: SKPhysicsContact) {
        contactShip(contact, category: bossBulletCategory, action: { [self] in
            if contact.bodyA.categoryBitMask == bossBulletCategory || contact.bodyB.categoryBitMask == bossBulletCategory {
                var node: SKNode?
                if contact.bodyA.node?.name != GSConstant.shared.shipName {
                    node = contact.bodyA.node
                } else if contact.bodyB.node?.name != GSConstant.shared.shipName {
                    node = contact.bodyB.node
                }
                let bullet = bossBulletList.filter({ $0 == node }).first
//                healthCount -= 1
                triggerBossBullet(b: bullet)
            }
        })
    }
    
    func contactBossWithShipBullet(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == shipBulletCategory && contact.bodyB.categoryBitMask == bossCategory) || (contact.bodyA.categoryBitMask == bossCategory && contact.bodyB.categoryBitMask == shipBulletCategory) {
            if contact.bodyA.categoryBitMask == shipBulletCategory || contact.bodyB.categoryBitMask == shipBulletCategory {
                var node: SKNode?
                if contact.bodyA.node?.name != GSConstant.shared.bossImageName {
                    node = contact.bodyA.node
                } else if contact.bodyB.node?.name != GSConstant.shared.bossImageName {
                    node = contact.bodyB.node
                }
                let bullet = shipBulletList.filter({ $0 == node }).first
                triggerShipBullet(b: bullet)
            }
        }
    }
}
