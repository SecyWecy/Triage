//
//  TriageApp.swift
//  Triage
//
//  Created by Seth Onyango on 04/10/2020.
//

import SwiftUI

@main
struct TriageApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
