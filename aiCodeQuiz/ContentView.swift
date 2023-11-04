//
//  ContentView.swift
//  aiCodeQuiz
//
//  Created by Trevor Clute on 11/2/23.
//

import SwiftUI
import OpenAISwift


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

struct ContentView: View {
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            GeometryReader{ proxy in
                ScrollView{
                    LazyVGrid(columns: [GridItem(.fixed(proxy.size.width * 0.48)),GridItem(.fixed(proxy.size.width * 0.48))]){
                        ForEach(Topic.all) { topic in
                            
                            TopicView(topic: topic, width: proxy.size.width * 0.48, height: proxy.size.height * 0.2)
                                .onTapGesture {
                                    path.append(topic)
                            }
                        }
                    }
                }
            }
            
    
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


/*
 
 your goal is to create a multiple choice question about \() in the java coding language. Output your response as JSON in this format:
 {
 "question": "",
 "a":"correct answer",
 "b":"incorrect answer",
 "c":"incorrect answer",
 "d":"incorrect answer"
 }
*/
