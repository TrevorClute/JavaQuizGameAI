//
//  Response.swift
//  aiCodeQuiz
//
//  Created by Trevor Clute on 11/3/23.
//

import Foundation

class Question:Decodable {
    var question:String
    var a:String
    var b:String
    var c:String
    var d:String
    
    func answers() -> [Answer]{
        var answers = [
            Answer(key: "a", answer: a, isCorrect: true),
            Answer(key: "b", answer: b, isCorrect: false),
            Answer(key: "c", answer: c, isCorrect: false),
            Answer(key: "d", answer: d, isCorrect: false),
        ].shuffled()
        let orderedKeys = ["a","b","c","d"]
        for (i, _) in answers.enumerated(){
            answers[i].key = orderedKeys[i]
        }
        return answers
    }
    
    static let loading:Question = try! JSONDecoder().decode(Question.self,from:"""
                                        {
                                        "question": "loading...",
                                        "a":"",
                                        "b":"",
                                        "c":"",
                                        "d":""
                                        }
                                        """.data(using: .utf8)! )
    
    enum CodingKeys: CodingKey {
        case question
        case a
        case b
        case c
        case d
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.question = try container.decode(String.self, forKey: .question)
        self.a = try container.decode(String.self, forKey: .a)
        self.b = try container.decode(String.self, forKey: .b)
        self.c = try container.decode(String.self, forKey: .c)
        self.d = try container.decode(String.self, forKey: .d)
    }
}
