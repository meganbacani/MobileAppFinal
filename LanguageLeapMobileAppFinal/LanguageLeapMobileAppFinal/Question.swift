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
    

}
