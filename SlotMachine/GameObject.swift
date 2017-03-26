//
//  GameObject.swift
//  SlotMachine
//
//  Created by Wenzhong Zheng on 2017-03-25.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import UIKit
import SpriteKit

class GameObject: SKSpriteNode {

    var width:CGFloat?
    var height:CGFloat?
    
    init(textureImage: UIImage) {
        let texture = SKTexture(image: textureImage)
        let color = UIColor.white
        super.init(texture: texture, color: color, size: texture.size())
        width = texture.size().width
        height = texture.size().height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Reset() {}
    func Start() {}
    func Update() {}
    
}
