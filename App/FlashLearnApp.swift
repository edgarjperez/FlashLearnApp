//
//  FlashLearnApp.swift
//  FlashLearn
//
//  Created by Edgar Perez on 3/5/25.
//

import SwiftUI

@main
struct FlashLearnApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabView {
                TopicsView()
                    .tabItem {
                        Label("Topics", systemImage: "book")
                    }
                Text("All Flashcards Coming Soon")
                    .tabItem {
                        Label("Flashcards", systemImage: "rectangle.on.rectangle")
                    }
                
                Text("Quick Quiz Coming Soon")
                    .tabItem {
                        Label("Quiz", systemImage: "questionmark.circle")
                    }
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
