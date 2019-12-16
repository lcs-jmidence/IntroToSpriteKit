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
        }
        
        // Add wall of crates
        for y in 1...5{
            for x in 1...5 {
                let crate = SKSpriteNode(imageNamed: "crate")
                crate.position = CGPoint(x: 100 * x + 650, y: 100 * y + 15)
                self.addChild(crate)
            }
        }
        
        // Add Snowman sprite
        let character = SKSpriteNode(imageNamed: "Snowman_01")
        // Increase the character's size
        let actionScaleUp = SKAction.scale(by: 4, duration: 0)
        character.run(actionScaleUp)
        // Position at bottom left
        character.position = CGPoint(x: 100, y: 145)
        // Create physics body
        character.physicsBody = SKPhysicsBody(texture: character.texture!, alphaThreshold: 0.5, size: character.size)
        self.addChild(character)
//                // Create [SKTexture] array
//                var throwSnowBallTextures: [SKTexture] = []     // Empty array
//                throwSnowBallTextures.append(SKTexture(imageNamed: "Snowman_01"))
//                throwSnowBallTextures.append(SKTexture(imageNamed: "Snowman_02"))
//                throwSnowBallTextures.append(SKTexture(imageNamed: "Snowman_03"))
//
//                // Create an action to animate throwing a fireball
//                let throwSnowballAnimation = SKAction.animate(with: throwSnowBallTextures, timePerFrame: 0.2, resize: true, restore: true)
//
//                // Wait a bit
//                let actionWaitASecond = SKAction.wait(forDuration: 1)
//
//                // Make a sequence – throw fireball, then wait
//                let actionThrowSnowBallThenWait = SKAction.sequence([throwSnowballAnimation, actionWaitASecond])
//
//                // Repeat the sequence
//                let throwSnowBallRepeatedly = SKAction.repeatForever(actionThrowSnowBallThenWait)
//
//                // Cause the character to throw the fireball
//                character.run(throwSnowBallRepeatedly)
        
    }
    
    // This runs before each frame is rendered 
    // Avoid putting computationally intense code in this function to maintain high performance
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
