//
//  ShipHealthBar.swift
//  SdTest
//
//  Created by admin on 15.01.2024.
//

import SpriteKit

extension BaseGameScene {
    func setupHealthBar() {
        healthBar = SKShapeNode()
        healthBar.path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: frame.width * 0.7, height: frame.height * 0.02)), cornerRadius: 12).cgPath
        healthBar.name = GSConstant.shared.healthName
        healthBar.position = CGPoint(x: frame.width * 0.15, y: frame.midY * 0.15)
        healthBar.fillColor = .green
        healthBar.strokeColor = .white
        addChild(healthBar)
    }
    
    func updateHealthBar(finish: @escaping () -> Void) {
        if healthCount <= 0 {
            finish()
            return
        }
        
        updateHealthBarPath(GSConstant.shared.shipHealthMap[healthCount] ?? 0)
    }
    
    func updateHealthBarPath(_ l: CGFloat) {
        healthBar.path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: (frame.width * 0.7) * l / 10, height: frame.height * 0.02)), cornerRadius: 12).cgPath
        switch l {
        case 7, 6:
            healthBar.fillColor = .yellow
        case 5, 4:
            healthBar.fillColor = .orange
        case 3, 2, 1, 0:
            healthBar.fillColor = .red
        default:
            healthBar.fillColor = .green
        }
    }
}
