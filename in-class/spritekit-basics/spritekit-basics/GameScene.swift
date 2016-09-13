//
//  GameScene.swift
//  spritekit-basics
//
//  Created by David Fleming on 8/28/16.
//  Copyright © 2016 defaultdave. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var gyroLabel: SKLabelNode!
    var motionManager = CMMotionManager()
    
    func setupMotion() {
        if motionManager.accelerometerAvailable {
            let updateTime: NSTimeInterval = 0.5
            motionManager.accelerometerUpdateInterval = updateTime;
            motionManager.startAccelerometerUpdates()
            
            motionManager.startAccelerometerUpdatesToQueue(
                NSOperationQueue.mainQueue(), withHandler: {
                    accellData, error in
                    if let data = accellData {
                        print(data.acceleration.x)
                        self.gyroLabel.text = "Gryo: x\(Double(data.acceleration.x).roundToPlaces(3)), y:\(Double(data.acceleration.y).roundToPlaces(3)), z:\(Double(data.acceleration.z).roundToPlaces(3))"
                        
                        self.physicsWorld.gravity.dx = CGFloat(data.acceleration.x * 10)
                        self.physicsWorld.gravity.dy = CGFloat(data.acceleration.y * 10)

                    }
                })
            
            
        } else {
            print ("accelerometer not available")
        }
    }
    
    
    
    override func didMoveToView(view: SKView) {
        // game code here please
        
        physicsWorld.gravity = CGVectorMake(0, -5)
        physicsWorld.contactDelegate = self
        
        let physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.name = "main"
        self.physicsBody = physicsBody
    
        createBall()
        
        gyroLabel = SKLabelNode(fontNamed: "Chalkduster")
        gyroLabel.text = "Gyro:"
        gyroLabel.fontSize = 13
        gyroLabel.fontColor = SKColor.redColor()
        gyroLabel.horizontalAlignmentMode = .Center
        gyroLabel.position = CGPoint(x: 200, y: size.height - 150)
        self.addChild(gyroLabel)
        
        setupMotion()
        
        
        
    }
    
    
    func createBall() {
        let ball = SKSpriteNode(imageNamed: "tribble")
        let ballSize = CGSize(width: 50, height: 50)
        ball.size = ballSize
        
        ball.position = CGPoint(x: size.width / 2, y: size.height / 2);
        
        self.addChild(ball)
        
        let ballRadius = CGFloat(ballSize.width / 2)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ballRadius)
        
        if let ballbody = ball.physicsBody {
            ballbody.friction = CGFloat(drand48() * 6)
            ballbody.restitution = CGFloat(drand48())
            ballbody.mass = CGFloat(drand48() * 100)
            
            ballbody.allowsRotation = true
            ballbody.affectedByGravity = true
            ballbody.contactTestBitMask = ballbody.collisionBitMask
            ballbody.dynamic = true
        }
        
        let emitter = SKEmitterNode(fileNamed: "ballSmoke.sks")
        if let ballEmitter = emitter {
            ballEmitter.particleColor = SKColor.blueColor()
            ballEmitter.targetNode = scene;
            ball.addChild(ballEmitter)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        createBall();
    }
    
    
}




//Helpful double rounder extension
extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
}
