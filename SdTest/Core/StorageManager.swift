//
//  StorageManager.swift
//  SdTest
//
//  Created by admin on 15.01.2024.
//

import SwiftUI
import SpriteKit

struct StorageManager {
    static let shared = StorageManager()
    private init() {}
    
    @AppStorage(SMKeys.SCENE_TYPE) private(set) var sceneType = SceneType.welcomeScene
    @AppStorage(SMKeys.SCENE_STAGE) private(set) var sceneStage = SceneStage.welcome
    
    func setScene(_ scene: SceneType) {
        sceneType = scene
    }
    
    func setStage(_ stage: SceneStage) {
        sceneStage = stage
    }
    
    func getSceneType(_ scene: SceneType) -> BaseGameScene {
        switch scene {
        case .welcomeScene:
            return WelcomeGameScene()
        case .basicGameScene:
            return BasicGameScene()
        case .beforeBossGameScene:
            return BeforeBossGameScene()
        case .bossGameScene:
            return BossGameScene()
        case .afterBossGameScene:
            return AfterBossGameScene()
        }
    }
}

struct SMKeys {
    static let SCENE_TYPE = "sceneType"
    static let SCENE_STAGE = "sceneStage"
}

enum SceneType: Int {
    case welcomeScene = 0
    case basicGameScene = 1
    case beforeBossGameScene = 2
    case bossGameScene = 3
    case afterBossGameScene = 4
}

enum SceneStage: Int {
    case welcome = 0
    case lvl1 = 1
    case lvl2 = 2
    case lvl3 = 3
    case lvl4 = 4
    case freeplay = 5
}
