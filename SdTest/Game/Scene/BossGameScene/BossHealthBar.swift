//
//  BossHealthBar.swift
//  SdTest
//
//  Created by admin on 15.01.2024.
//

import SpriteKit

extension BossGameScene {
    
    func setupBossHealthBar() {
        bossHealthBar = SKShapeNode()
        bossHealthBar.path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: frame.midX * 0.5, height: frame.height * 0.01)), cornerRadius: 12).cgPath
        bossHealthBar.name = "bossHealthBar"
        bossHealthBar.position = CGPoint(x: boss.position.x - boss.size.width / 2, y: boss.position.y + boss.size.height * 0.6)
        bossHealthBar.fillColor = .green
        bossHealthBar.strokeColor = .white
        addChild(bossHealthBar)
    }
    
    func updateBossHealthBar(finish: @escaping (Bool) -> Void) {
        if bossHealthCount <= 0 {
            finish(true)
            return
        }
        updateBossHealthBarPath(GSConstant.shared.bossHealthMap[bossHealthCount] ?? 0)
    }
    
    func updateBossHealthBarPath(_ l: CGFloat) {
        bossHealthBar.path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: (frame.midX * 0.5) * l / 20, height: frame.height * 0.01)), cornerRadius: 12).cgPath
        switch l {
        case 17, 16, 15, 14, 13, 12:
            bossHealthBar.fillColor = .yellow
        case 11, 10, 9, 8, 7, 6:
            bossHealthBar.fillColor = .orange
        case 5, 4, 3, 2, 1, 0:
            bossHealthBar.fillColor = .red
        default:
            bossHealthBar.fillColor = .green
        }
    }
}
