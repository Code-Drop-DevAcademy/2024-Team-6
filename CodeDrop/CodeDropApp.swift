//
//  CodeDropApp.swift
//  CodeDrop
//
//  Created by 신승아 on 6/14/24.
//

import SwiftUI
import SwiftData

@main
struct CodeDropApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            RecordModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
        .modelContainer(sharedModelContainer)
    }
}
