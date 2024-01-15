//
//  GameViewController.swift
//  SdTest
//
//  Created by admin on 09.01.2024.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    
    override func loadView() {
        self.view = SKView()
    }
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        if let skView = self.view as? SKView {
            
            let scene = BossGameScene()
//            let scene = StorageManager.shared.getSceneType(StorageManager.shared.sceneType)
            scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            scene.navigationController = self.navigationController
            skView.presentScene(scene)
        
            
            skView.showsFPS = true
        } else {
            print("jopa")
        }
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
