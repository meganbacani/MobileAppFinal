//
//  ViewController.swift
//  LanguageLeapMobileAppFinal
//
//  Created by Tina Li on 4/11/17.
//  Copyright © 2017 Megan Bacani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var chineseButton: UIButton!
    @IBOutlet weak var koreanButton: UIButton!
    @IBOutlet weak var spanishButton: UIButton!
    var currLanguage: UIButton?
    var languageStr: String?
    
    @IBOutlet weak var selectLang: UILabel!
    @IBOutlet weak var language: UILabel!
    var chineseQuestions:[Question]  = [Question(language: .chinese, question: "Which one means hello?", options: ["ni hao", "zai jian", "bu hao", "chi"], correctAnsIndex:0)]
    var koreanQuestions:[Question]  = [Question(language: .korean, question: "What one means hello?", options: ["ani", "appa", "annyeong", "ne"], correctAnsIndex:2)]
    var spanishQuestions:[Question]  = [Question(language: .spanish, question: "What does hola mean?", options: ["goodbye", "hello", "car", "jump"], correctAnsIndex:1), Question(language: .spanish, question: "What does uno mean?", options: ["goodnight", "eating", "one", "two"], correctAnsIndex:2), Question(language: .spanish, question: "Which one means red?", options: ["hola", "azul", "rojo", "rosa"], correctAnsIndex:2), Question(language: .spanish, question: "Which one means two?", options: ["dos", "tres", "hola", "cinco"], correctAnsIndex:0), Question(language: .spanish, question: "Which one means 'See you later'?", options: ["adios", "buenas noches", "hola", "hasta luego"], correctAnsIndex:3)]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print ("in correct view on load")
        chineseButton.layer.cornerRadius = 25
        chineseButton.layer.borderWidth = 1
        chineseButton.layer.borderColor = UIColor.white.cgColor
        chineseButton.clipsToBounds = true;
        
        koreanButton.layer.cornerRadius = 25
        koreanButton.layer.borderWidth = 1
        koreanButton.layer.borderColor = UIColor.white.cgColor
        koreanButton.clipsToBounds = true;
        
        spanishButton.layer.cornerRadius = 25
        spanishButton.layer.borderWidth = 1
        spanishButton.layer.borderColor = UIColor.white.cgColor
        spanishButton.clipsToBounds = true;
        
        print(chineseQuestions[0].question!)
        print(koreanQuestions[0].question!)
        print(spanishQuestions[0].question!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chineseTouched(_ sender: UIButton) {
        currLanguage?.layer.borderWidth = 0
        currLanguage = chineseButton
        chineseButton.layer.borderWidth = 3
        chineseButton.layer.borderColor = UIColor.black.cgColor
        language.text = "Let's Learn... Chinese"
        languageStr = "Chinese"
        selectLang.backgroundColor = UIColor.clear
        
    }
    @IBAction func koreanTouched(_ sender: UIButton) {
        currLanguage?.layer.borderWidth = 0
        currLanguage = koreanButton
        koreanButton.layer.borderWidth = 3
        koreanButton.layer.borderColor = UIColor.black.cgColor
        language.text = "Let's Learn... Korean"
        languageStr = "Korean"
        selectLang.backgroundColor = UIColor.clear
    }
    @IBAction func spanishTouched(_ sender: UIButton) {
        currLanguage?.layer.borderWidth = 0
        currLanguage = spanishButton
        spanishButton.layer.borderWidth = 3
        spanishButton.layer.borderColor = UIColor.black.cgColor
        language.text = "Let's Learn... Spanish"
        languageStr = "Spanish"
        selectLang.backgroundColor = UIColor.clear

    }

    @IBAction func beginTouched(_ sender: UIButton) {
        if currLanguage != nil {
            print("can begin game")
            print(languageStr)
            
        }
        else{
            selectLang.backgroundColor = UIColor.red
            print("language not selected")
        }
    }
}
