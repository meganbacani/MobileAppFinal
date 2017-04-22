//
//  Question.swift
//  LanguageLeapMobileAppFinal
//
//  Created by Megan Bacani on 4/11/17.
//  Copyright © 2017 Megan Bacani. All rights reserved.
//

import Foundation
import UIKit

class Question {
    
    enum LanguageType {
        case chinese
        case korean
        case spanish
    }
    
    var language:LanguageType
    var question: String?
    var options:[String]
    var correctAnsIndex: Int
    
    init(language:LanguageType, question:String?, options:[String], correctAnsIndex:Int) {
        self.options = options
        self.question = question
        self.correctAnsIndex = correctAnsIndex
        self.language = language
    }
    
    init(dict:[String:String])
    {
        self.options = [dict["option0"]!,dict["option1"]!,dict["option2"]!,dict["option3"]!];
        self.question = dict["question"]!;
        self.correctAnsIndex = Int(dict["correctAnsIndex"]!)!;
        
        let languageString = dict["language"]!;
        self.language = LanguageType.chinese;
        
        if languageString == "chinese" {self.language = LanguageType.chinese}
        if languageString == "korean" {self.language = LanguageType.korean}
        if languageString == "korean" {self.language = LanguageType.spanish}
        

    }
    
    func toDictionary() -> [String:String] {
        var languageString="";
        if language == LanguageType.chinese {languageString = "chinese";}
        if language == LanguageType.korean {languageString = "korean";}
        if language == LanguageType.spanish {languageString = "spanish";}
        
        
        return ["question":question!,"correctAnsIndex":String(correctAnsIndex),"language":languageString,"option0":options[0],"option1":options[1],"option2":options[2],"option3":options[3]];
    }
    
    
    

}
