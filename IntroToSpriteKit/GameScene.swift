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
        title.fontSize = 36
        title.fontColor = NSColor(calibratedRed: 34/255, green: 192/255, blue: 32/255, alpha: 1)
        title.zPosition = 2
        title.text = "Feliz"
        title.position = CGPoint(x: self.size.width - 400, y: self.size.height - 50)
        self.addChild(title)
        // Add Navidad
        let title1 = SKLabelNode(fontNamed: "Herculanum")
        title1.fontSize = 36
        title1.fontColor = .red
        title1.zPosition = 2
        title1.text = "Navidad"
        title1.position = CGPoint(x: self.size.width - 100, y: self.size.height - 50)
        self.addChild(title1)
        
        // Add wall of crates
        for y in 1...5{
            for x in 1...5 {
                let crate = SKSpriteNode(imageNamed: "crate")
                crate.position = CGPoint(x: 100 * x + 650, y: 100 * y + 15)
                crate.zPosition = 3
                self.addChild(crate)
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
        // Create physics body
        Snowman.physicsBody = SKPhysicsBody(texture: Snowman.texture!, alphaThreshold: 0.5, size: Snowman.size)
        Snowman.zPosition = 2
        self.addChild(Snowman)
                // Create [SKTexture] array
                var throwSnowBallTextures: [SKTexture] = []
                throwSnowBallTextures.append(SKTexture(imageNamed: "Snowman_01"))
                throwSnowBallTextures.append(SKTexture(imageNamed: "Snowman_02"))
                throwSnowBallTextures.append(SKTexture(imageNamed: "Snowman_03"))

                // Create an action to animate throwing a snowball
        let throwSnowballAnimation = SKAction.animate(with: throwSnowBallTextures, timePerFrame: 1.2, resize: true, restore: true)

                // Wait a bit
                let actionWaitASecond = SKAction.wait(forDuration: 1)

                // Make a sequence – throw snowball, then wait
                let actionThrowSnowBallThenWait = SKAction.sequence([throwSnowballAnimation, actionWaitASecond])

                // Repeat the sequence
                let throwSnowBallRepeatedly = SKAction.repeatForever(actionThrowSnowBallThenWait)

                // Cause the character to throw the snowball
                Snowman.run(throwSnowBallRepeatedly)
        
    }
    
    // This runs before each frame is rendered 
    // Avoid putting computationally intense code in this function to maintain high performance
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
