//
//  QuestionView.swift
//  aiCodeQuiz
//
//  Created by Trevor Clute on 11/3/23.
//

import SwiftUI

struct QuestionView: View {
    @StateObject var viewModel:ViewModel = .init()
    @State var text:String = ""
    @State var response:String = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func send(){
        if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return
        }
        viewModel.send(text: self.text){ response in
            DispatchQueue.main.async {
                self.response = response
                print(response)
            }
        }
    }
}

#Preview {
    QuestionView()
}
