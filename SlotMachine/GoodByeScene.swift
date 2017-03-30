//
//  GoodByeScene.swift
//  SlotMachine
//
//  Created by Wenzhong Zheng on 2017-03-30.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import SpriteKit

class GoodByeScene: SKScene {

    let goodByeNode: SKSpriteNode = {
        let skNode = SKSpriteNode()
        let label = SKLabelNode(text: "GoodBye")
        label.fontSize = 50
        label.fontName = "Helvetica Neue"
        label.fontColor = SKColor(red: 255/255, green: 229/255, blue: 171/255, alpha: 1)
        label.horizontalAlignmentMode = .center
        label.position = CGPoint(x: 0, y: 0)
        skNode.position = CGPoint(x: 0, y: 0)
        skNode.addChild(label)
        return skNode
    }()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(goodByeNode)
    }
    
}
