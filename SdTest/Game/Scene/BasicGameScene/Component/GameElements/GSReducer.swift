//
//  GSReduser.swift
//  SdTest
//
//  Created by admin on 12.01.2024.
//

import SpriteKit

extension BasicGameScene {
    
    func createReducerField() {
        if hasShield || hasReducer {
            return
        }
        if Int.random(in: 0...400) != 0 {
            return
        }
        if reducerField == nil {
            reducerField = createObstacleObject(imageName: GSConstant.shared.shipImageName, name: GSConstant.shared.shipName, size: CGSize(width: frame.width * 0.1, height: frame.width * 0.1), category: reducerCategory, contactBitMask: shipCategory, speed: CGFloat.random(in: 3.5...6.9))
            addChild(reducerField ?? SKSpriteNode())
        } else {
            return
        }
    }
    
    func moveReducerField() {
        guard let reducer = reducerField else {
            return
        }
        reducer.position.y -= reducer.speed
        if reducer.position.y <= -reducer.size.height {
            reducerField = nil
        }
    }
    
    func checkReducer() {
        reducerTimeLeft -= 1
        if reducerTimeLeft == 30 {
            setShipNormalSize()
        }
        if reducerTimeLeft == 15 {
            setShipReduceSize()
        }
        if reducerTimeLeft <= 0 {
            setShipNormalSize()
            reducerTimeLeft = 0
            hasReducer = false
        }
    }
    
    func setupReducer() {
        reducerTimeLeft = 300
        hasReducer = true
        setShipReduceSize()
    }
    
    func setShipNormalSize() {
        ship.setScale(1.0)
    }
    
    func setShipReduceSize() {
        ship.setScale(0.5)
    }
}
