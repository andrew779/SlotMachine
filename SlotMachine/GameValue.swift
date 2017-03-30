//
//  StatusModel.swift
//  SlotMachine
//
//  Created by Wenzhong Zheng on 2017-03-28.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import Foundation

class GameValue: NSObject {
    private var _playerMoney = 1000
    private var _winnings = 0
    private var _jackpot = 5000
    private var _playerBet = 1
    
    var playerMoney:Int{
        get{
            return _playerMoney
        }
        set{
            _playerMoney = newValue
        }
    }
    var winnings: Int{
        get{
            return _winnings
        }
        set{
            _winnings = newValue
        }
    }
    var jackpot: Int{
        get{
            return _jackpot
        }
        set{
            _jackpot = newValue
        }
    }
    var playerBet: Int{
        get{
            return _playerBet
        }
        set{
            _playerBet = newValue
        }
    }
}
