//
//  ContentView.swift
//  Journi
//
//  Created by Huy Ong on 1/28/24.
//

import SwiftUI
import SwiftData

struct JourniView: View {
    var journi: Journi
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(journi.content)
                .lineLimit(15)
            Divider()
            HStack {
                Text(journi.createdDate, format: .dateTime)
                    .bold()
                    .foregroundStyle(.secondary)
                    .font(.caption)
                Spacer()
                Image(systemName: "ellipsis")
            }
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

let topColor = Color(red: 46 / 255.0, green: 43 / 255.0, blue: 60 / 255.0)
let bottomColor = Color(red: 75 / 255.0, green: 52 / 255.0, blue: 89 / 255.0)

// Create the gradient
let gradient = LinearGradient(
    gradient: Gradient(colors: [topColor, bottomColor]),
    startPoint: .top,
    endPoint: .bottom
)

struct ContentView: View {
    @Query private var journies: [Journi]
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
            .background(gradient)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                appearance.backgroundEffect = UIBlurEffect(style: .systemThinMaterialDark)
                UINavigationBar.appearance().standardAppearance = appearance
//                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
