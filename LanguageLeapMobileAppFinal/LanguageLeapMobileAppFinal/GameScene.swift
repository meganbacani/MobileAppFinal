//
//  GameScene.swift
//  TinaLi-Game
//
//  Created by Tina Li on 3/29/17.
//  Copyright © 2017 Tina Li. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    enum CollisionTypes: UInt32 {
        case player = 1
        case fence = 2
    }
    
    var gameController = GameViewController()
    var imageName = String()
    var player:SKSpriteNode!
    let fence = SKSpriteNode(imageNamed: "fence")
    var buttons:[SKSpriteNode] = []
    var score = -1
    var gameOver = false
    var fenceCleared = true
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector.zero
        
        backgroundColor = SKColor.white
        addPlayer()

        self.run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addFences),
                SKAction.wait(forDuration: 4.0),
                SKAction.run(askQuestion),
                SKAction.wait(forDuration: 10.0)
                ])
        ))
    }
    
    func addPlayer(){
        player = SKSpriteNode(imageNamed: imageName)
        player.position = CGPoint(x: size.width * 0.2, y: size.height * 0.1)
        
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: player.size.width*0.4, height: player.size.height*0.4))
        player.physicsBody?.usesPreciseCollisionDetection = true
        player.physicsBody?.isDynamic = true
        
        player.physicsBody?.categoryBitMask = CollisionTypes.player.rawValue
        player.physicsBody?.contactTestBitMask = CollisionTypes.fence.rawValue
        player.physicsBody?.collisionBitMask = 0
        
        addChild(player)
    }
    
    func addFences(){
        fence.position = CGPoint(x: size.width * 0.9, y: size.height * 0.1)
        
        fence.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: fence.size.width*0.4, height: fence.size.height*0.4))
        fence.physicsBody?.usesPreciseCollisionDetection = true
        fence.physicsBody?.isDynamic = true
        
        fence.physicsBody?.categoryBitMask = CollisionTypes.fence.rawValue
        fence.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
        fence.physicsBody?.collisionBitMask = 0
        
        addChild(fence)
        
        let actionMove = SKAction.move(to: CGPoint(x: -size.width*0.3, y: size.height * 0.1), duration: 3)
        let actionMoveDone = SKAction.removeFromParent()
        fence.run(SKAction.sequence([actionMove, actionMoveDone]))
        
        score += 1
    }
    
    func addButtons(){
        let w = self.frame.width
        let h = self.frame.height
        let positions = [CGPoint(x: w * 0.25, y: h * 0.8), CGPoint(x: w * 0.75, y: h * 0.8), CGPoint(x: w * 0.25, y: h * 0.8 - 60.0), CGPoint(x: w * 0.75, y: h * 0.8 - 60.0)]
        let red = [102.0/255.0, 102.0/255.0, 255.0/255.0, 255.0/255.0]
        let green = [204.0/255.0, 255.0/255.0, 111.0/255.0, 204.0/255.0]
        let blue = [255.0/255.0, 102.0/255.0, 207.0/255.0, 102.0/255.0]
        
        print()
        for i in 0..<4 {
            let buttonColor:SKColor = UIColor(red: CGFloat(red[i]), green: CGFloat(green[i]), blue: CGFloat(blue[i]), alpha: 1.0)
            let button = SKSpriteNode(color: buttonColor, size: CGSize(width: self.frame.width/2.0, height: 60))
            button.position = positions[i]
            button.isUserInteractionEnabled = true
            buttons.append(button)
            self.addChild(button)
        }
    }
    
    func addText(){
        let answers = ["A", "B", "C", "D"]
        for i in 0..<4{
            let myLabel = SKLabelNode(fontNamed:"Chalkduster")
            myLabel.fontSize = 30
            myLabel.fontColor = SKColor.white
            myLabel.horizontalAlignmentMode = .center
            myLabel.verticalAlignmentMode = .center
            myLabel.text = answers[i]
            buttons[i].addChild(myLabel)
        }
        
        let question = "This is a question?"
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        let w = self.frame.width
        let h = self.frame.height
        myLabel.fontSize = 30
        myLabel.fontColor = SKColor.black
        myLabel.horizontalAlignmentMode = .center
        myLabel.verticalAlignmentMode = .center
        myLabel.position = CGPoint(x: w * 0.50, y: h * 0.9)
        myLabel.text = question
        self.addChild(myLabel)
    }
    
    func askQuestion(){
        addButtons()
        addText()
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        player.removeFromParent()
        fence.removeFromParent()
        let finalScore = score
        self.removeAllActions()
        gameController.stopGame(finalScore)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let jumpUpAction = SKAction.moveBy(x: 0, y:size.height * 0.40, duration:0.6)
        let jumpDownAction = SKAction.moveBy(x: 0, y:-(size.height * 0.40), duration:0.6)
        let jumpSequence = SKAction.sequence([jumpUpAction, jumpDownAction])
        
        // make player run sequence
        player.run(jumpSequence)
    }
}

