//
//  TopicsView.swift
//  FlashLearn
//
//  Created by Edgar Perez on 3/5/25.
//

import SwiftUI

struct TopicsView: View {
    let topics = DataStore.sampleTopics
    
    var body: some View {
        NavigationView {
            List(topics) { topic in
                NavigationLink(destination: ReaderView(topic: topic)) {
                    VStack(alignment: .leading) {
                        Text(topic.title)
                            .font(.headline)
                        Text(topic.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationBarTitle("Topics")
        }
    }
}

#Preview {
    TopicsView()
}
