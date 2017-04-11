//
//  ViewController.swift
//  LanguageLeapMobileAppFinal
//
//  Created by Tina Li on 4/11/17.
//  Copyright © 2017 Megan Bacani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func testButtonPress(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: self)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
