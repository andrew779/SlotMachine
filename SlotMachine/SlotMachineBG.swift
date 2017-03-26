//
//  SlotMachineBG.swift
//  SlotMachine
//
//  Created by Wenzhong Zheng on 2017-03-25.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import UIKit
import SpriteKit

class SlotMachineBG: SKSpriteNode {
    
    let spinButton: SKSpriteNode = {
        let button = SKSpriteNode(imageNamed: "SPIN")
        button.size = #imageLiteral(resourceName: "SPIN").size
        button.position = CGPoint(x: 260, y: -385)
        return button
    }()
    
    let resetButton: SKSpriteNode = {
        let button = SKSpriteNode(imageNamed: "RESET")
        button.size = #imageLiteral(resourceName: "RESET").size
        button.position = CGPoint(x: -260, y: -385)
        return button
    }()
    
    let betOneButton: SKSpriteNode = {
        let button = SKSpriteNode(imageNamed: "BET_ONE")
        button.size = #imageLiteral(resourceName: "BET_ONE").size
        button.position = CGPoint(x: -100, y: -380)
        return button
    }()
    
    let betMaxButton: SKSpriteNode = {
        let button = SKSpriteNode(imageNamed: "BET_MAX")
        button.size = #imageLiteral(resourceName: "BET_MAX").size
        button.position = CGPoint(x: 60, y: -380)
        return button
    }()
    
    let totalLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.text = "123,456"
        label.fontSize = 30
        label.fontName = "Helvetica Neue"
        label.fontColor = SKColor(red: 255/255, green: 229/255, blue: 171/255, alpha: 1)
        label.horizontalAlignmentMode = .right
        label.position = CGPoint(x: -115, y: -245)
        return label
    }()
    
    let betLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.text = "25"
        label.fontSize = 30
        label.fontName = "Helvetica Neue"
        label.fontColor = SKColor(red: 255/255, green: 229/255, blue: 171/255, alpha: 1)
        label.horizontalAlignmentMode = .right
        label.position = CGPoint(x: 50, y: -245)
        return label
    }()
    
    let winLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.text = "200"
        label.fontSize = 30
        label.fontName = "Helvetica Neue"
        label.fontColor = SKColor(red: 255/255, green: 229/255, blue: 171/255, alpha: 1)
        label.horizontalAlignmentMode = .right
        label.position = CGPoint(x: 300, y: -245)
        return label
    }()
    
    let jackpotLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.text = "5,000"
        label.fontSize = 34
        label.fontName = "Helvetica Neue"
        label.fontColor = SKColor(red: 255/255, green: 229/255, blue: 171/255, alpha: 1)
        label.horizontalAlignmentMode = .center
        label.position = CGPoint(x: 3, y: 166)
        return label
    }()
    
    init() {
        let texture = SKTexture(image: #imageLiteral(resourceName: "bg"))
        super.init(texture: texture, color: .white, size: #imageLiteral(resourceName: "bg").size)
        self.addChild(spinButton)
        self.addChild(resetButton)
        self.addChild(betOneButton)
        self.addChild(betMaxButton)
        self.addChild(totalLabel)
        self.addChild(betLabel)
        self.addChild(winLabel)
        self.addChild(jackpotLabel)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Start() {
    }
}
