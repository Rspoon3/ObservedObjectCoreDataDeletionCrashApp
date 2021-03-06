//
//  ObservedObjectCoreDataDeletionCrashApp.swift
//  ObservedObjectCoreDataDeletionCrash
//
//  Created by Richard Witherspoon on 11/10/21.
//

import SwiftUI

@main
struct ObservedObjectCoreDataDeletionCrashApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
