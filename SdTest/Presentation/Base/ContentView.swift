//
//  ContentView.swift
//  SdTest
//
//  Created by admin on 09.01.2024.
//

import SwiftUI
import UIKit
import SpriteKit

struct ContentView: View {
    var body: some View {
//        var scene = GameScene()
//        scene.siz
//        SpriteView(scene: <#T##SKScene#>)
        BaseViewController()
            .ignoresSafeArea(.all)
    }
}

struct BaseViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = ViewController()
        let nav = UINavigationController(rootViewController: viewController)
        nav.setNavigationBarHidden(true, animated: false)
        return nav
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


