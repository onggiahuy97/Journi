//
//  JourniApp.swift
//  Journi
//
//  Created by Huy Ong on 1/28/24.
//

import SwiftUI

@main
struct JourniApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Journi.self])
        }
    }
}
