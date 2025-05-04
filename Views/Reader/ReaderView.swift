//
//  ReaderView.swift
//  FlashLearn
//
//  Created by Edgar Perez on 3/5/25.
//

import SwiftUI

struct ReaderView: View {
    let topic: Topic
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 16) {
                Text(topic.title)
                    .font(.largeTitle)
                    .bold()
                
                Text(topic.content)
                    .font(.body)
                    .lineSpacing(5)
                
                Spacer(minLength: 30)
                
                NavigationLink(destination: FlashcardsView(topicID: topic.id)) {
                    Text("Review Flashcards")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ReaderView(topic: DataStore.sampleTopics[0])
    }
}
