//
//  OpenAiConnector.swift
//  aiCodeQuiz
//
//  Created by Trevor Clute on 11/2/23.
//

import Foundation
import OpenAISwift


class ViewModel: ObservableObject {
    init(){}
    private var client:OpenAISwift?
    
    func setup(){
        client = OpenAISwift(config: .makeDefaultOpenAI(apiKey: "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"))
    }
    func send(text:String, completion: @escaping (String)->Void){
        client?.sendCompletion(with: text, maxTokens:500){result in
            switch result{
            case .success(let model):
                let output = model.choices?.first?.text ?? "-"
                completion(output)
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
}
