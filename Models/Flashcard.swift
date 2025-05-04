//
//  Flashcard.swift
//  FlashLearn
//
//  Created by Edgar Perez on 3/5/25.
//

import Foundation

struct Flashcard: Identifiable {
    let id: UUID
    let topicID: UUID
    let question: String
    let answer: String
    var lastReviewed: Date?
    var dificulty: Int = 0 // 0-5 scale
    
}
