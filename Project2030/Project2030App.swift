//
//  Project2030App.swift
//  Project2030
//
//  Created by Hibah Abdullah Alatawi on 02/11/1444 AH.
//

import SwiftUI

@main
struct Project2030App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
