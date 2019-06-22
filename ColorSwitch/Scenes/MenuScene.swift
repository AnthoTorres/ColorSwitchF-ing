//
//  MenuScene.swift
//  ColorSwitch
//
//  Created by Anthony Torres on 6/21/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        addLogo()
        addLabels()
    }
    
    func addLogo() {
        let logo = SKSpriteNode(imageNamed: "logo")
        logo.size = CGSize(width: frame.width/4, height: frame.width/4)
        logo.position = CGPoint(x: frame.midX, y: frame.midY + frame.size.height/4)
        addChild(logo)
        
    }
    
    func addLabels() {
        let playLabel = SKLabelNode(text: "Lets F'ing Go!!!")
        playLabel.fontName = "AvenirNext-Bold"
        playLabel.fontSize = 50.0
        playLabel.fontColor = UIColor.white
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(playLabel)
        animate(label: playLabel)
        
        let hightScoreLabel = SKLabelNode(text: "You at your Best: " + "\(UserDefaults.standard.integer(forKey: "You at your Best"))")
        hightScoreLabel.fontName = "AvenirNext-Bold"
        hightScoreLabel.fontSize = 40.0
        hightScoreLabel.fontColor = UIColor.white
        hightScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - hightScoreLabel.frame.height*4)
        addChild(hightScoreLabel)
        
        let recentScoreLabel = SKLabelNode(text: "Ha Ha You Suck:" + "\(UserDefaults.standard.integer(forKey: "Ha Ha You Suck"))")
        recentScoreLabel.fontName = "AvenirNext-Bold"
        recentScoreLabel.fontSize = 40.0
        recentScoreLabel.fontColor = UIColor.white
        recentScoreLabel.position = CGPoint(x: frame.midX, y: hightScoreLabel.position.y - recentScoreLabel.frame.size.height*2)
        addChild(recentScoreLabel)
    }
    
    func animate(label: SKLabelNode) {
        //let fadeOut = SKAction.fadeOut(withDuration: 0.5) using fade in an out for sequence we can swich
        //let fadeIn = SKAction.fadeIn(withDuration: 0.5) TTP label to blink on and off
        
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.5)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.5)
        
        let sequence = SKAction.sequence([scaleUp,scaleDown])
        label.run(SKAction.repeatForever(sequence))
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: view!.bounds.size)
        view!.presentScene(gameScene)
    }

}
