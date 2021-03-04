//
//  GameScene.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 03/03/2021.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: .systemPink, size: CGSize(width: 40, height: 40))
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 40))
        addChild(box)
    }
}

struct GameSceneView: View {
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 500)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
    }
}
