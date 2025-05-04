//
//  FlashcardsView.swift
//  FlashLearn
//
//  Created by Edgar Perez on 3/5/25.
//

import SwiftUI

struct FlashcardsView: View {
    let topicID: UUID
    @State private var currentIndex: Int = 0
    @State private var isShowingAnswer: Bool = false
    
    var flashcards: [Flashcard] {
        DataStore.flashcardsForTopic(topicID: topicID)
    }
    
    var body: some View {
        VStack {
            if flashcards.isEmpty {
                Text("No flashcards available for this topic")
                    .font(.headline)
                    .padding()
            } else {
                VStack {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(radius: 5)
                        
                        VStack(spacing: 20) {
                            Text(isShowingAnswer ? "Answer" : "Question")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text(isShowingAnswer ? flashcards[currentIndex].answer : flashcards[currentIndex].question)
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
                    
                    Text("Tap card to flip")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    HStack(spacing: 50) {
                        Button(action: previousCard) {
                            Image(systemName: "arrow.left.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                        }
                        .disabled(currentIndex == 0)
                        .opacity(currentIndex == 0 ? 0.3 : 1.0)
                        
                        Button(action: nextCard) {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                        }
                        .disabled(currentIndex >= flashcards.count - 1)
                        .opacity(currentIndex >= flashcards.count - 1 ? 0.3 : 1.0)
                    }
                    .padding(.bottom)
                    
                    NavigationLink(destination: QuizView(topicID: topicID)) {
                        Text("Start Quiz")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .navigationTitle("Flashcards")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            isShowingAnswer = false
            currentIndex = 0
        }
    }
    
    private func nextCard() {
        if currentIndex < flashcards.count - 1 {
            isShowingAnswer = false
            currentIndex += 1
        }
    }
    
    private func previousCard() {
        if currentIndex > 0 {
            isShowingAnswer = false
            currentIndex -= 1
        }
    }
}
