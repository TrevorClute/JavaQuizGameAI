//
//  Answer.swift
//  aiCodeQuiz
//
//  Created by Trevor Clute on 11/4/23.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var key:String
    var answer:String
    var isCorrect:Bool
}
