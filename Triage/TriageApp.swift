//
//  TriageApp.swift
//  Triage
//
//  Created by Seth Onyango on 04/10/2020.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct TriageApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
        return WindowGroup {
            
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
