//
//  Topic.swift
//  aiCodeQuiz
//
//  Created by Trevor Clute on 11/3/23.
//

import Foundation
import SwiftUI

struct Topic:Identifiable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    var id = UUID()
    var name:String
    var prompt:String
    var description:String
    var colors:[Color]
    var image:Image
    static let all:[Topic] = [
        .init(name: "OOP", prompt: "object oriented programming", description: "learn about object oriented programming concepts.", colors: [.mint,.green], image: Image(systemName: "square.grid.4x3.fill")),
        .init(name: "Loops", prompt: "for loops, while loops, and for each loops", description: "learn about for-loops, forEach-loops, and, while-loops.", colors: [.pink,.indigo], image:Image(systemName: "arrow.triangle.2.circlepath")),
        .init(name: "Conditionals", prompt: "conditional statements", description: "learn about if, if-else, and else if statements.", colors: [.blue,.cyan], image: Image(systemName: "arrow.triangle.branch")),
        .init(name: "Types", prompt: "primitive types, and reference types", description: "learn primitive and reference types.", colors: [.pink,.purple], image: Image(systemName: "apple.terminal")),
        .init(name: "Methods", prompt: "methods including parameters and return types", description: "learn about the implementation of methods including return types to parameters", colors: [.yellow,.orange], image: Image(systemName: "return")),
        .init(name: "recursion", prompt: "recursion and recrusive functions", description: "learn about recursive methods.", colors: [.darkGreen,.green], image: Image(systemName: "square.stack"))
        
    ]
}
