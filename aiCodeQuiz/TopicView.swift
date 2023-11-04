//
//  TopicView.swift
//  aiCodeQuiz
//
//  Created by Trevor Clute on 11/2/23.
//

import SwiftUI

struct TopicView: View {
    var topic:Topic
    var width:CGFloat
    var height:CGFloat
    var body: some View {
        ZStack{
            topic.image
                .resizable()
                .scaledToFit()
                .frame(width: width * 0.6, height: height * 0.5,alignment: .topTrailing)
                .padding(10)
                .foregroundStyle(
                    LinearGradient(
                        colors: topic.colors,
                        startPoint: .bottomTrailing,
                        endPoint: .topLeading
                    )
                    .opacity(0.2)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            VStack(alignment: .leading, spacing:0){
                Text(topic.name)
                    .foregroundStyle(topic.colors[1])
                    .shadow(color:topic.colors[0],radius: 7, x: 0, y: 0)
                    .font(.title2.smallCaps())
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                Text(topic.description)
                    .frame(width: width * 0.7,alignment: .topLeading)
                    .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:.topLeading)
                    .font(.system(size: width * 0.07,weight: .light, design: .rounded).smallCaps())
                    .foregroundStyle(topic.colors[0])
                    .colorMultiply(Color(white: 1))
                    
            }
            .padding(9)
        }
        .background(
            LinearGradient(
                colors: topic.colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .opacity(0.3)
        )
        .clipShape(.rect(cornerRadius: 10))
        .frame(width: width, height: height)
        
    }
}

#Preview {
    TopicView(topic: Topic.all[1], width: 130, height: 130)
}


