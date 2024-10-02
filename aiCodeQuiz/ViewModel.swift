//
//  OpenAiConnector.swift
//  aiCodeQuiz
//
//  Created by Trevor Clute on 11/2/23.
//

import Foundation
import SwiftOpenAI


class ViewModel: ObservableObject {
    init(){}
    var service:OpenAIService?
    let questionSchema = JSONSchema(type: .object, properties:[
        "question" : JSONSchema(type: .string),
        "a" : JSONSchema(type: .string),
        "b" : JSONSchema(type: .string),
        "c" : JSONSchema(type: .string),
        "d" : JSONSchema(type: .string),
    ], required: ["question", "a", "b", "c", "d"], additionalProperties: false)
    var tool:ChatCompletionParameters.Tool?
    
    func setup(){
        let apikey = ProcessInfo.processInfo.environment["API_KEY"]
        service = OpenAIServiceFactory.service(apiKey: apikey!)
        tool = ChatCompletionParameters.Tool(function: .init(name: "Question", strict: true, description: "for creating question object", parameters: questionSchema))
    }
    
    func send(text:String, completion: @escaping (String)->Void) {
        let parameters = ChatCompletionParameters(messages: [.init(role: .user, content: .text(text))], model: .gpt35Turbo)
        Task{
            do{
                let choices = try await service!.startChat(parameters: parameters).choices
                completion(choices[0].message.content ?? "")
            }
            catch{
                print(error)
            }
        }
    }
}
