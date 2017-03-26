//
//  PlayScene.swift
//  SlotMachine
//
//  Created by Wenzhong Zheng on 2017-03-25.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import UIKit
import SpriteKit

class PlayScene: SKScene {
    let slotMachine = SlotMachineBG()
    
    
    override func didMove(to view: SKView) {
        addChild(slotMachine)

    }
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if slotMachine.spinButton.contains(pos){
            print("spinButton Tapped")
        } else if slotMachine.betOneButton.contains(pos) {
            print("betOneButton Tapped")
        } else if slotMachine.betMaxButton.contains(pos) {
            print("betMaxButton Tapped")
        } else if slotMachine.resetButton.contains(pos) {
            print("resetButton Tapped")
        } else if slotMachine.quitButton.contains(pos) {
            print("quitButton Tapped")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {self.touchUp(atPoint: t.location(in: self))}
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    // Game Loop - trigger 60FPS
//    override func update(_ currentTime: TimeInterval) {
//        
//    }
}
