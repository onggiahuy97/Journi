//
//  PreviewSampleData.swift
//  Journi
//
//  Created by Huy Ong on 1/29/24.
//

import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Journi.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        let modelContext = container.mainContext
        if try modelContext.fetch(FetchDescriptor<Journi>()).isEmpty {
            Journi.sample.forEach { container.mainContext.insert($0) }
        }
        return container
    } catch {
        fatalError("Fail to create container")
    }
}()
