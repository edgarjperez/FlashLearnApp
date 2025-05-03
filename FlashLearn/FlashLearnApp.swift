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
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
