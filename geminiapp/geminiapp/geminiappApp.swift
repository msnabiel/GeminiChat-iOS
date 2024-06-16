//
//  geminiappApp.swift
//  geminiapp
//
//  Created by Syed Nabiel Hasaan M on 16/06/24.
//

import SwiftUI

@main
struct geminiappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
