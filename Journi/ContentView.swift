//
//  ContentView.swift
//  Journi
//
//  Created by Huy Ong on 1/28/24.
//

import SwiftUI
import SwiftData

struct SchemeColor {
    static let topColor = Color(red: 46 / 255.0, green: 43 / 255.0, blue: 60 / 255.0)
    static let bottomColor = Color(red: 75 / 255.0, green: 52 / 255.0, blue: 89 / 255.0)
    
    static let gradientInDarkMode = LinearGradient(
        gradient: Gradient(colors: [topColor, bottomColor]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    static let gradientInLightMode = LinearGradient(
        gradient: Gradient(colors: [Color(uiColor: .systemGray6).opacity(0.9), Color(uiColor: .systemGray6).opacity(0.97)]),
        startPoint: .top,
        endPoint: .bottom
    )
}

struct ContentView: View {
    @Query private var journies: [Journi]
    @Environment(\.colorScheme) private var scheme
    @Environment(\.modelContext) private var modelContext
      
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(journies) { journi in
                        JourniView(journi: journi)
                    }
                }
            }
            .navigationTitle("Journi")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem {
                    Button("New") {
                        let journi = Journi.init(createdDate: .init(), content: "")
                        modelContext.insert(journi)
                        try? modelContext.save()
                    }
                    .tint(.white)
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.gray.opacity(0.75), Color.gray.opacity(0.35)]),
                    startPoint: .bottom,
                    endPoint: .top
                )
                .opacity(0.75)
            )
            .background(Material.ultraThin)
            .onAppear {
                updateNavBarAppearance(scheme)
            }
            .onChange(of: scheme) { _, _ in
                updateNavBarAppearance(scheme)
            }
        }
    }
    
    private func updateNavBarAppearance(_ input: ColorScheme) {
        DispatchQueue.main.async {
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [.foregroundColor: input == .light ? UIColor.black : UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: input == .light ? UIColor.black : UIColor.white]
            appearance.backgroundEffect = UIBlurEffect(style: .systemThinMaterialDark)
            UINavigationBar.appearance().standardAppearance = appearance
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
