//
//  GameScene.swift
//  IntroToSpriteKit
//
//  Created by Russell Gordon on 2019-12-07.
//  Copyright © 2019 Russell Gordon. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    
    // Background music player
    var backgroundMusic: AVAudioPlayer?
    
    // This function runs once to set up the scene
    override func didMove(to view: SKView) {
        
        // Set the background colour
        //self.backgroundColor = .black
        
        //         //Example to play background music
        //        // Get a reference to the mp3 file in the app bundle
        //        let backgroundMusicFilePath = Bundle.main.path(forResource: "sleigh-bells-excerpt.mp3", ofType: nil)!
        //
        //        // Convert the file path string to a URL (Uniform Resource Locator)
        //        let backgroundMusicFileURL = URL(fileURLWithPath: backgroundMusicFilePath)
        //
        //        // Attempt to open and play the file at the given URL
        //        do {
        //            backgroundMusic = try AVAudioPlayer(contentsOf: backgroundMusicFileURL)
        //            backgroundMusic?.play()
        //        } catch {
        //            // Do nothing if the sound file could not be played
        //        }
        
        
        // Define a 12 second wait
        let longWait = SKAction.wait(forDuration: 12)
        let showEndCredits = SKAction.run(removeEverythingThenShowEndCredits)
        let waitThenShowCredits = SKAction.sequence([longWait, showEndCredits])
        self.run(waitThenShowCredits)
        
        // Define an action that causes a node to wait for 2.4 seconds
        let actionThreeSecondWait = SKAction.wait(forDuration: 2.4)
        
        // Show "Use" after 3 seconds
        let showUseWord = SKAction.run {
            self.show(what: "Use", at: 150)
        }
        
        // Sequence to show that word after 3 seconds
        let waitThenShowUse = SKAction.sequence([actionThreeSecondWait, showUseWord])
        self.run(waitThenShowUse)
        
        // Define an action that causes a node to wait for 6 seconds
        let actionSixSecondWait = SKAction.wait(forDuration: 6.0)
        
        // Show "Use" after 3 seconds
        let showTheWord = SKAction.run {
            self.show(what: "The", at: 250)
        }
        
        // Sequence to show that word after 6 seconds
        let waitThenShowThe = SKAction.sequence([actionSixSecondWait, showTheWord])
        self.run(waitThenShowThe)
        
        // Define an action that causes a node to wait for 9 seconds
        let actionNineSecondWait = SKAction.wait(forDuration: 9.0)
        
        // Show "Force" after 9 seconds
        let showForceWord = SKAction.run {
            self.show(what: "Force", at: 350)
        }
        
        // Sequence to show that word after 9 seconds
        let waitThenShowForce = SKAction.sequence([actionNineSecondWait, showForceWord])
        self.run(waitThenShowForce)
        
        // Add background with specific image and center it
        let winterBackground = SKSpriteNode(imageNamed: "winterBackground")
        winterBackground.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        self.addChild(winterBackground)
        
        // Add winter tiles as flooring
        for v in 0...12 {
            let winterTile = SKSpriteNode(imageNamed: "winterTile")
            winterTile.position = CGPoint(x: 100 * v, y: 0)
            self.addChild(winterTile)
            winterTile.physicsBody = SKPhysicsBody(texture: winterTile.texture!,
                                                   alphaThreshold: 0.5,
                                                   size: winterTile.size)
            winterTile.physicsBody?.isDynamic = false
            winterTile.zPosition = 1
        }
        
        // Create a label saying "Feliz Navidad" behind the wall of crates
        let title = SKLabelNode(fontNamed: "Herculanum")
        title.fontSize = 96
        title.fontColor = NSColor(calibratedRed: 34/255, green: 192/255, blue: 32/255, alpha: 1)
        title.zPosition = 2
        title.text = "Feliz"
        title.position = CGPoint(x: self.size.width - 280, y: self.size.height - 500)
        self.addChild(title)
        // Add Navidad
        let title1 = SKLabelNode(fontNamed: "Herculanum")
        title1.fontSize = 96
        title1.fontColor = .red
        title1.zPosition = 2
        title1.text = "Navidad"
        title1.position = CGPoint(x: self.size.width - 280, y: self.size.height - 600)
        self.addChild(title1)
        
        // Add wall of crates
        for y in 1...4{
            for x in 1...5 {
                let crate = SKSpriteNode(imageNamed: "crate")
                crate.name = "one of the crates"
                crate.position = CGPoint(x: 100 * x + 650, y: 100 * y + 15)
                crate.zPosition = 3
                self.addChild(crate)
                // Add a physics body for all nodes with identifier "one of the crates"
                for node in self.children {
                    
                    // Only look at nodes of type SKSpriteNode
                    if let thisNode = node as? SKSpriteNode {
                        
                        // Only the crates
                        if thisNode.name == "one of the crates" {
                            
                            // Add a physics body
                            thisNode.physicsBody = SKPhysicsBody(rectangleOf: thisNode.size)
                        }
                        
                    }
                    
                }
                crate.physicsBody?.mass = 8.6
            }
        }
        
        // Make it Snow
        if let snowing = SKEmitterNode(fileNamed: "Snow") {
            
            // Position the snow (node)
            snowing.position = CGPoint(x: self.size.width / 2, y: self.size.height)
            snowing.zPosition = 0
            self.addChild(snowing) 
            
        }
        
        // Add Snowman sprite
        let Snowman = SKSpriteNode(imageNamed: "Snowman_01")
        // Increase the character's size
        let actionScaleUp = SKAction.scale(by: 4, duration: 0)
        Snowman.run(actionScaleUp)
        // Position at bottom left
        Snowman.position = CGPoint(x: 100, y: 145)
        Snowman.zPosition = 5
        self.addChild(Snowman)
        // Create [SKTexture] array
        var throwSnowBallTextures: [SKTexture] = []
        throwSnowBallTextures.append(SKTexture(imageNamed: "Snowman_01"))
        throwSnowBallTextures.append(SKTexture(imageNamed: "Snowman_02"))
        throwSnowBallTextures.append(SKTexture(imageNamed: "Snowman_03"))
        
        // Create an action to animate throwing a snowball
        let throwSnowballAnimation = SKAction.animate(with: throwSnowBallTextures, timePerFrame: 0.8, resize: true, restore: true)
        
        // Wait a bit
        let actionWaitASecond = SKAction.wait(forDuration: 1)
        
        // Make a sequence – throw snowball, then wait
        let actionThrowSnowBallThenWait = SKAction.sequence([throwSnowballAnimation, actionWaitASecond])
        
        // Repeat the sequence
        let throwSnowBallRepeatedly = SKAction.repeatForever(actionThrowSnowBallThenWait)
        
        // Cause the character to throw the snowball
        Snowman.run(throwSnowBallRepeatedly)
        
        // Add a circle "projectile"
        let circle1 = SKSpriteNode(imageNamed: "circle")
        circle1.position = CGPoint(x: 450, y: 200)
        circle1.physicsBody = SKPhysicsBody(circleOfRadius: circle1.size.width * 0.5)
        self.addChild(circle1)
        circle1.physicsBody?.mass = 6.3
        // Define actions for the circle
        
        // Define a vector that moves it to the right
        let rightThisMuch = CGVector(dx: 250, dy: 0)
        
        // Define an action that causes it to move sideways for half a second
        let actionSidewaysMovement = SKAction.move(by: rightThisMuch, duration: 0.5)
        
        let actionShortWaitThenMoveRight = SKAction.sequence([actionThreeSecondWait, actionSidewaysMovement])
        
        let actionRepeatWaitThenJump = SKAction.repeatForever(actionShortWaitThenMoveRight)
        circle1.run(actionRepeatWaitThenJump)
        
        
        
        
    }
    
    // Remove everything and show end credits
    func removeEverythingThenShowEndCredits() {
        
        // Remove all existing children nodes
        self.removeAllChildren()
        
        // Change background to black
        self.backgroundColor = .black
        
        // Add end credits
        
        // By...
        let by = SKLabelNode(fontNamed: "Helvetica Neue")
        by.fontSize = 48
        by.fontColor = .white
        by.text = "Brought to you by Julio Midence"
        by.zPosition = 3
        by.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 + 50)
        self.addChild(by)
        
        // And...
        let and = SKLabelNode(fontNamed: "Helvetica Neue")
        and.fontSize = 36
        and.fontColor = .white
        and.text = "and the Grade 12 Computer Science class"
        and.zPosition = 3
        and.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 - 50)
        self.addChild(and)
        
    }
    
    // Show a word
    func show(what text: String, at x: CGFloat) {
        
        // Show text
        let word = SKLabelNode(fontNamed: "Herculanum")
        word.fontSize = 36
        word.fontColor = .yellow
        word.text = text
        word.zPosition = 5
        word.position = CGPoint(x: x, y: 350)
        self.addChild(word)
        
    }
    
    // This runs before each frame is rendered 
    // Avoid putting computationally intense code in this function to maintain high performance
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
