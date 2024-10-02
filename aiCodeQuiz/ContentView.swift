//
//  ContentView.swift
//  aiCodeQuiz
//
//  Created by Trevor Clute on 11/2/23.
//

import SwiftUI
import OpenAISwift




struct ContentView: View {
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            GeometryReader{ proxy in
                ScrollView{
                    VStack{
                        HStack{
                            Text("mr.cooper AI")
                                .font(.largeTitle.smallCaps().bold())
                                .padding(.leading)
                            Spacer()
                            Image("java")
                                .resizable()
                                .scaledToFit()
                                .frame(width: proxy.size.width * 0.2, height: proxy.size.height * 0.08)
                        }
                        
                    }
                    
                    VStack(alignment: .leading){
                        Text("select topic")
                            .foregroundStyle(.secondary)
                            .font(.callout.smallCaps())
                            .padding(.leading,5)
                        LazyVGrid(columns: [GridItem(.fixed(proxy.size.width * 0.44)),GridItem(.fixed(proxy.size.width * 0.44))]){
                            ForEach(Topic.all) { topic in
                                TopicView(topic: topic, width: proxy.size.width * 0.44, height: proxy.size.height * 0.2)
                                    .onTapGesture {
                                        path.append(topic)
                                }
                                
                            }
                        }
                    }
                    .padding()
                    .padding(.vertical)
                    .padding(.bottom)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 10))
                    
                }
            }
            .navigationDestination(for: Topic.self){ topic in
                QuestionView(topic: topic)
                    .navigationBarBackButtonHidden()
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
