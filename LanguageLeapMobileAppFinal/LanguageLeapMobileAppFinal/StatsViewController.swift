//
//  StatsViewController.swift
//  LanguageLeapMobileAppFinal
//
//  Created by Maxwell Foley on 4/19/17.
//  Copyright © 2017 Megan Bacani. All rights reserved.
//

import Foundation

import UIKit
import Firebase

class StatsViewController: UIViewController {

    @IBOutlet weak var cGamesPlayed: UILabel!
    @IBOutlet weak var cHighScore: UILabel!
    @IBOutlet weak var cWordsLearned: UILabel!
    
    @IBOutlet weak var kGamesPlayed: UILabel!
    @IBOutlet weak var kHighScore: UILabel!
    @IBOutlet weak var kWordsLearned: UILabel!
    
    @IBOutlet weak var sGamesPlayed: UILabel!
    @IBOutlet weak var sHighScore: UILabel!
    @IBOutlet weak var sWordsLearned: UILabel!
    
    var rootRef : FIRDatabaseReference?;

    override func viewDidLoad() {
        super.viewDidLoad()

        rootRef = FIRDatabase.database().reference()

        //just get all the info off of the server
        if let rrSafe = rootRef
        {
            
            let refChild = rrSafe.child("stats");
            
            refChild.child("cGamesPlayed").observe(FIRDataEventType.value, with: { (snapshot) in
                self.cGamesPlayed.text = snapshot.value as? String;
            })

            refChild.child("cHighScore").observe(FIRDataEventType.value, with: { (snapshot) in
                self.cHighScore.text = snapshot.value as? String;
            })
            
            refChild.child("cWordsLearned").observe(FIRDataEventType.value, with: { (snapshot) in
                self.cWordsLearned.text = snapshot.value as? String;
            })
            
            
            refChild.child("kGamesPlayed").observe(FIRDataEventType.value, with: { (snapshot) in
                self.kGamesPlayed.text = snapshot.value as? String;
            })
            
            refChild.child("kHighScore").observe(FIRDataEventType.value, with: { (snapshot) in
                self.kHighScore.text = snapshot.value as? String;
            })
            
            refChild.child("kWordsLearned").observe(FIRDataEventType.value, with: { (snapshot) in
                self.kWordsLearned.text = snapshot.value as? String;
            })
            
            
            refChild.child("sGamesPlayed").observe(FIRDataEventType.value, with: { (snapshot) in
                self.sGamesPlayed.text = snapshot.value as? String;
            })
            
            refChild.child("sHighScore").observe(FIRDataEventType.value, with: { (snapshot) in
                self.sHighScore.text = snapshot.value as? String;
            })
            
            refChild.child("sWordsLearned").observe(FIRDataEventType.value, with: { (snapshot) in
                self.sWordsLearned.text = snapshot.value as? String;
            })
        
        }
 
        
    }
    
}
