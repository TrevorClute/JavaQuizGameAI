//
//  Response.swift
//  aiCodeQuiz
//
//  Created by Trevor Clute on 11/3/23.
//

import Foundation

class Response:Decodable {
    var question:String
    var a:String
    var b:String
    var c:String
    var d:String
    
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
