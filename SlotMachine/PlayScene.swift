//
//  PlayScene.swift
//  SlotMachine
//
//  Created by Wenzhong Zheng on 2017-03-25.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class PlayScene: SKScene {
    let slotMachine = SlotMachineBG()
        
    var gameValue = GameValue()
    

    
    // MARK: - global varialbles
    let maxBet = 25
    
    enum fruitTally: String {
        case grape
        case banana
        case orange
        case cherry
        case blank
        case bell
        case seven
        case bar
    }
    var grapes = 0;
    var bananas = 0;
    var oranges = 0;
    var cherries = 0;
    var bars = 0;
    var bells = 0;
    var sevens = 0;
    var blanks = 0;
    
    override func didMove(to view: SKView) {
        addChild(slotMachine)
        showPlayerStates()
    }

    func resetGameValue(){
        gameValue.jackpot = 5000
        gameValue.playerBet = 0
        gameValue.playerMoney = 1000
        gameValue.winnings = 0
    }
    
    func betCoin(coin: Int){
        if gameValue.playerMoney <= 0 {
            gameValue.playerBet = 0
            print("you don't have enough money")
            return
        }
        
        if gameValue.playerMoney >= (coin + gameValue.playerBet) {
            if gameValue.playerBet > maxBet {
                gameValue.playerBet = 1
            } else {
                gameValue.playerBet += coin
            }
            
        } else {
            if gameValue.playerBet >= gameValue.playerMoney {
                gameValue.playerBet = 1
            } else {
                gameValue.playerBet += coin
            }
        }
    }
    
    func betMaxCoin() {
        if gameValue.playerMoney >= maxBet {
            gameValue.playerBet = maxBet
        } else {
            gameValue.playerBet = gameValue.playerMoney
        }
    }
    
    func determineWinnings(){
        if blanks == 0
        {
            if (grapes == 3) {
                gameValue.winnings = gameValue.playerBet * 10;
            }
            else if(bananas == 3) {
                gameValue.winnings = gameValue.playerBet * 20;
            }
            else if (oranges == 3) {
                gameValue.winnings = gameValue.playerBet * 30;
            }
            else if (cherries == 3) {
                gameValue.winnings = gameValue.playerBet * 40;
            }
            else if (bars == 3) {
                gameValue.winnings = gameValue.playerBet * 50;
            }
            else if (bells == 3) {
                gameValue.winnings = gameValue.playerBet * 75;
            }
            else if (sevens == 3) {
                gameValue.winnings = gameValue.playerBet * 100;
            }
            else if (grapes == 2) {
                gameValue.winnings = gameValue.playerBet * 2;
            }
            else if (bananas == 2) {
                gameValue.winnings = gameValue.playerBet * 2;
            }
            else if (oranges == 2) {
                gameValue.winnings = gameValue.playerBet * 3;
            }
            else if (cherries == 2) {
                gameValue.winnings = gameValue.playerBet * 4;
            }
            else if (bars == 2) {
                gameValue.winnings = gameValue.playerBet * 5;
            }
            else if (bells == 2) {
                gameValue.winnings = gameValue.playerBet * 10;
            }
            else if (sevens == 2) {
                gameValue.winnings = gameValue.playerBet * 20;
            }
            else if (sevens == 1) {
                gameValue.winnings = gameValue.playerBet * 5;
            }
            else {
                gameValue.winnings = gameValue.playerBet * 1;
            }
            
            gameValue.playerMoney += gameValue.winnings
        }
        else
        {
            gameValue.playerMoney -= gameValue.playerBet
            gameValue.winnings = 0
            betCoin(coin: 0) // use to revalidate remaining credit
            print("you loss")
        }
        
        resetFruitTally()
        
        
    }
    
    func reels(){
        if gameValue.playerBet == 0 {
            print("can't spin when bet coin is 0")
            return
        }
        var betLine:[fruitTally] = [fruitTally.blank,fruitTally.blank,fruitTally.blank]
        var outCome = [0,0,0]
        
        for spin in 0...2 {
            outCome[spin] = GKARC4RandomSource().nextInt(upperBound: 65) + 1
            getBetLineValue(betLineValue: &betLine[spin], outComeValue: outCome[spin])
            
            //see real value
            print(outCome[spin])
            print(betLine[spin])
        }
        
        getBetLineImage(betLine: betLine)
        checkJackPot()
        determineWinnings()
    }
    
    func getBetLineImage(betLine: [fruitTally]) {
        slotMachine.firstReel.texture = SKTexture(imageNamed: betLine[0].rawValue)
        slotMachine.secondReel.texture = SKTexture(imageNamed: betLine[1].rawValue)
        slotMachine.thirdReel.texture = SKTexture(imageNamed: betLine[2].rawValue)
    }
    
    func getBetLineValue(betLineValue:inout fruitTally ,outComeValue: Int) {
        switch outComeValue {
            // 41.5% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 1, upperBounds: 27):
            betLineValue = .blank
            blanks += 1
            // 15.4% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 28, upperBounds: 37):
            betLineValue = .grape
            grapes += 1
            // 13.8% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 38, upperBounds: 46):
            betLineValue = .banana
            bananas += 1
            // 12.3% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 47, upperBounds: 54):
            betLineValue = .orange
            oranges += 1
            //  7.7% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 55, upperBounds: 59):
            betLineValue = .cherry
            cherries += 1
            //  4.6% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 60, upperBounds: 62):
            betLineValue = .bar
            bars += 1
            //  3.1% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 63, upperBounds: 64):
            betLineValue = .bell
            bells += 1
        case checkRange(outComeValue: outComeValue, lowerBounds: 65, upperBounds: 65):
            betLineValue = .seven
            sevens += 1
        default:
            betLineValue = .blank
            blanks += 1
        }
    }
    
    func checkRange(outComeValue value:Int, lowerBounds:Int, upperBounds: Int) -> Int{
        if value >= lowerBounds && value <= upperBounds {
            return value
        } else {
            return 0
        }
    }
    
    func showPlayerStates(){
        slotMachine.playerStates = gameValue
    }

    func checkJackPot() {
        let jackPotTry = GKARC4RandomSource().nextInt(upperBound: 51)
        let jackPotWin = GKARC4RandomSource().nextInt(upperBound: 51)
        if jackPotTry == jackPotWin {
            print("you win the \(gameValue.jackpot)")
        }
    }
    
    func resetFruitTally() {
        grapes = 0;
        bananas = 0;
        oranges = 0;
        cherries = 0;
        bars = 0;
        bells = 0;
        sevens = 0;
        blanks = 0;
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if slotMachine.spinButton.contains(pos){
            reels()
            print("spinButton Tapped")
        } else if slotMachine.betOneButton.contains(pos) {
            betCoin(coin: 1)
            print("betOneButton Tapped")
        } else if slotMachine.betMaxButton.contains(pos) {
            betMaxCoin()
            print("betMaxButton Tapped")
        } else if slotMachine.resetButton.contains(pos) {
            resetGameValue()
            print("resetButton Tapped")
        } else if slotMachine.quitButton.contains(pos) {
            let goodByeScene = GoodByeScene(size: (self.view?.frame.size)!)
            self.scene?.view?.presentScene(goodByeScene)
            print("quitButton Tapped")
        }
        slotMachine.updatePlayerStates()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {self.touchUp(atPoint: t.location(in: self))}
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }

}
