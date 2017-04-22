//
//  GameViewController.swift
//  TinaLi-Game
//
//  Created by Tina Li on 3/29/17.
//  Copyright © 2017 Tina Li. All rights reserved.
//

import UIKit
import SpriteKit
import Firebase

class GameViewController: UIViewController {
    
    @IBOutlet weak var endView: UIView!
    @IBOutlet weak var finalScore: UILabel!
    var qArray:[Question] = []
    var languageString = ""
    var gamesPlayed:Int?;
    var highScore :Int?;
    var wordsLearned:Int?;
    
    var rootRef : FIRDatabaseReference?;


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
        finalScore.text = "Final Score: \(score)";
        
        //get existing info from the server
        
        let index = languageString.index(languageString.startIndex, offsetBy: 1)
        let firstLetter = languageString.substring(to: index);
        let gpString = firstLetter + "GamesPlayed";
        let hsString = firstLetter + "HighScore";
        let wlString = firstLetter + "WordsLearned";
        
        rootRef = FIRDatabase.database().reference()

      //  if let rrSafe = rootRef
        //{
            
            let refChild = rootRef!.child("stats");

        
        refChild.child(gpString).observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
                let str = (snapshot.value as? String)!;
                print(str);
                self.gamesPlayed = Int(str);
                var newGamesPlayed = self.gamesPlayed! + 1;
                refChild.child(gpString).setValue(String(newGamesPlayed));

            })
        
            
        refChild.child(hsString).observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
                let str = (snapshot.value as? String)!;
                print(str);
                self.highScore = Int(str);
                var newHighScore : Int;
                if score > self.highScore! {newHighScore = score} else {newHighScore = self.highScore!}
                refChild.child(hsString).setValue(String(newHighScore));

            })
            
        refChild.child(wlString).observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
                let str = (snapshot.value as? String)!;
                print(str);

                self.wordsLearned = Int(str);
                var newWordsLearned = self.wordsLearned! + score;
                

                refChild.child(wlString).setValue(String(newWordsLearned));

            })
            
      //  }
        
        
        

        

        
        
        
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
