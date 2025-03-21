//
//  diGOPApp.swift
//  diGOP
//
//  Created by Benedictus Yogatama Favian Satyajati on 20/03/25.
//

import SwiftUI
import SwiftData
import CoreLocation
import MapKit

@main
struct diGOPApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            Nickname.self
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
            SplashScreenView()
        }
        .modelContainer(sharedModelContainer)
    }
}
