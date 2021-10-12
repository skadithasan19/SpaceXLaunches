//
//  SpaceXLaunchesApp.swift
//  SpaceXLaunches
//
//  Created by Adit Hasan on 10/12/21.
//

import SwiftUI

@main
struct SpaceXLaunchesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
