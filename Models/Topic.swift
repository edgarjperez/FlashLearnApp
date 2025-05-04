//
//  Topic.swift
//  FlashLearn
//
//  Created by Edgar Perez on 3/5/25.
//

import Foundation

struct Topic: Identifiable {
    let id: UUID
    let title: String
    let description: String
    let content: String
    let isCompleted: Bool =  false
}
