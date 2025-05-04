//
//  FlashcardView.swift
//  FlashLearn
//
//  Created by Edgar Perez on 3/5/25.
//

import SwiftUI

struct FlashcardView: View {
    let flashcard: Flashcard
    @Binding var isShowingAnswer: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 5)
            
            VStack(spacing: 20) {
                Text(isShowingAnswer ? "Answer" : "Question")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(isShowingAnswer ? flashcard.answer : flashcard.question)
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
        }
        .frame(height: 300)
        .padding()
        .onTapGesture {
            withAnimation {
                isShowingAnswer.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        FlashcardsView(topicID: DataStore.sampleTopics[0].id)
    }
}
