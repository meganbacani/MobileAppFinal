//
//  GameViewController.swift
//  TinaLi-Game
//
//  Created by Tina Li on 3/29/17.
//  Copyright © 2017 Tina Li. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var endView: UIView!
    @IBOutlet weak var finalScore: UILabel!
    var qArray:[Question] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        scene.imageName = "frog"
        scene.gameController = self
        scene.qArray = qArray
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    func stopGame(_ score:Int){
        endView.isHidden = false
        finalScore.text = "Final Score: \(score)"
    }
    
    @IBAction func replayPressed(_ sender: UIButton) {
        endView.isHidden = true
        viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destController = segue.destination as! ViewController
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
