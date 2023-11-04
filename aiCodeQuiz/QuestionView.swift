//
//  QuestionView.swift
//  aiCodeQuiz
//
//  Created by Trevor Clute on 11/3/23.
//

import SwiftUI

struct QuestionView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel:ViewModel = .init()
    @State var response:String = ""
    @State var question:Question? = Question.loading
    @State var answered:Bool = false
    var topic:Topic
    var answers:[Answer]{
        if let answers = question?.answers() {
            return answers
        }
        return [
            Answer(key: "a", answer: "loading", isCorrect: false),
            Answer(key: "b", answer: "loading", isCorrect: false),
            Answer(key: "c", answer: "loading", isCorrect: false),
            Answer(key: "d", answer: "loading", isCorrect: false)
        ]
    }
    var body: some View {
        GeometryReader{ proxy in


                VStack(alignment:.leading){
                    
                    HStack{
                        Text(topic.name)
                            .font(.system(size: proxy.size.width * 0.12).bold())
                        topic.image
                            .resizable()
                            .scaledToFit()
                            .frame(width: proxy.size.width * 0.12, height: proxy.size.height * 0.05)
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity,alignment:.leading)
                    
                    Text(question?.question ?? "loading")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: proxy.size.height * 0.2,alignment:.topLeading)
                        .overlay{
                            RoundedRectangle(cornerRadius: 15)
                                .stroke()
                        }
                    
                    ScrollView{
                        ForEach(answers) { answer in
                            AnswerView(answer: answer, answered: $answered)
                                
                        }
                    }
                    .scrollIndicators(.never)
                    
                    Spacer()
                    
                    HStack{
                        Button{
                            dismiss()
                        } label: {
                            Text("exit")
                        }
                        
                        Spacer()
                        
                        Button{
                            answered = false
                            question = Question.loading
                            send()
                        } label: {
                            Text("next")
                        }
                    }
                    .padding(.bottom, proxy.size.height * 0.05)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            

        }
        .onAppear{
            viewModel.setup()
            send()
        }
    }
    
    func send(){
        viewModel.send(text: question(from: topic.prompt)){ response in
            DispatchQueue.main.async {
                self.response = response
                question = try? JSONDecoder().decode(Question.self, from: response.data(using: .utf8)!)
            }
        }
    }
    
    func question(from prompt:String) -> String {
        return(
        """
         your goal is to create a multiple choice question about \(prompt) in the java coding language. Output your response as JSON in this format:
         {
         "question": "",
         "a":"correct answer",
         "b":"incorrect answer",
         "c":"incorrect answer",
         "d":"incorrect answer"
         }
        """
        )
    }
}

#Preview {
    QuestionView(topic: Topic.all[0])
}

struct AnswerView:View {
    @State var isRevealed:Bool = false
    
    var answer:Answer
    
    @Binding var answered:Bool
    
    var color: Color {
        return answer.isCorrect ? .green.opacity(0.8) : .red.opacity(0.8)
    }
    
    var correctReveal:Bool {
        if answered && answer.isCorrect {
            return true
        }
        return false
    }
    
    var body: some View {
        HStack{
            Text(answer.key)
                .font(.title.smallCaps())
                .padding(.trailing)
            Text(answer.answer)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background((isRevealed || correctReveal) ? color : .secondary.opacity(0.2))
        .clipShape(.rect(cornerRadius: ((isRevealed || correctReveal) ? 10 : 30)))
        .onTapGesture {
            if answered {
                return
            }
            withAnimation(.spring()){
                isRevealed = true
                answered = true
            }
            
        }
    }
}
