//
//  QuizView.swift
//  FlashLearn
//
//  Created by Edgar Perez on 3/5/25.
//

import SwiftUI

struct QuizView: View {
    let topicID: UUID
    
    @State private var flashcards: [Flashcard] = []
    @State private var currentIndex: Int = 0
    @State private var score: Int = 0
    @State private var showingAnswer: Bool = false
    @State private var quizComplete: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            if quizComplete {
                quizCompleteView
            } else if !flashcards.isEmpty {
                quizProgressView
                
                Spacer()
                
                VStack {
                    Text(flashcards[currentIndex].question)
                        .font(.title2)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    
                    if showingAnswer {
                        Text(flashcards[currentIndex].answer)
                            .font(.title3)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(10)
                        
                    }
                }
                .padding()
                
                Spacer()
                
                if !showingAnswer {
                    Button("Show Answer") {
                        showingAnswer = true
                    }
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.bottom)
                } else {
                    HStack(spacing: 20) {
                        Button("Incorrect") {
                            recordAnswer(correct: false)
                        }
                        .font(.headline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        Button("Correct") {
                            recordAnswer(correct: true)
                        }
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.bottom)
                }
            } else {
                Text("No flashcards available for this quiz")
                    .font(.headline)
                    .padding()
            }
        }
        .navigationTitle("Quiz")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadFlashcards()
        }
    }
    
    private var quizProgressView: some View {
        HStack {
            Text("Question \(currentIndex + 1)/\(flashcards.count)")
                .font(.headline)
            
            Spacer()
            
            Text("Score: \(score)")
                .font(.headline)
                .foregroundColor(.green)
        }
        .padding(.horizontal)
    }
    
    private var quizCompleteView: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.green)
            
            Text("Quiz Completed!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your score: \(score) out of \(flashcards.count)")
                .font(.title2)
            
            Text("Accuracy: \(Int((Double(score) / Double(flashcards.count)) * 100))%")
                .font(.title3)
                .padding(.bottom, 30)
            
            Button("Leave Quiz") {
                dismiss()
            }
            .font(.headline)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.top)
        }
        .padding()
    }
    
    private func loadFlashcards() {
        flashcards = DataStore.flashcardsForTopic(topicID: topicID)
        currentIndex = 0
        score = 0
        showingAnswer = false
        quizComplete = false
        
        // Optional: Shuffle the flashcards for a more varied quiz experience
        flashcards.shuffle()
    }
        
    private func recordAnswer(correct: Bool) {
        if correct {
            score += 1
        }
        
        // Move to next question or end quiz
        if currentIndex < flashcards.count - 1 {
            currentIndex += 1
            showingAnswer = false
        } else {
            quizComplete = true
        }
    }
}

#Preview {
    NavigationView {
        QuizView(topicID: DataStore.sampleTopics[0].id)
    }
}
