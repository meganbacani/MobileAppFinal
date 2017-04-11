//
//  GameViewController.swift
//  LanguageLeapMobileAppFinal
//
//  Created by Megan Bacani on 4/11/17.
//  Copyright © 2017 Megan Bacani. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    
    @IBOutlet weak var chineseButton: UIButton!
    @IBOutlet weak var koreanButton: UIButton!
    @IBOutlet weak var spanishButton: UIButton!
    var currLanguage: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    @IBAction func chineseTouched(_ sender: UIButton) {
        currLanguage?.layer.borderWidth = 0
        currLanguage = chineseButton
        chineseButton.layer.borderWidth = 3
        chineseButton.layer.borderColor = UIColor.white as! CGColor
        
    }
    @IBAction func koreanTouched(_ sender: UIButton) {
        currLanguage?.layer.borderWidth = 0
        currLanguage = chineseButton
        koreanButton.layer.borderWidth = 3
        koreanButton.layer.borderColor = UIColor.white as! CGColor
    }
    @IBAction func spanishTouched(_ sender: UIButton) {
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
