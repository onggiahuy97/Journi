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
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

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
            .background(Color(uiColor: UIColor.systemGray6))
            .overlay {
                VStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.white)
                                .shadow(radius: 2, y: 2)
                            Image(systemName: "plus")
                                .foregroundStyle(.blue)
                                .font(.title)
                                .bold()
                        }
                        .frame(width: 85, height: 85)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
