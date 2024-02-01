//
//  JourniView.swift
//  Journi
//
//  Created by Huy Ong on 2/1/24.
//

import SwiftUI

struct JourniView: View {
    var journi: Journi
    
    @Environment(\.colorScheme) private var scheme
    
    @State private var text = ""
    
    var body: some View {
        NavigationLink {
            TextEditor(text: $text)
                .navigationBarTitleDisplayMode(.inline)
                .padding()
                .onAppear {
                    text = journi.content
                }
                .onDisappear {
                    journi.content = text
                }
        } label: {
            VStack(alignment: .leading) {
                Text(journi.content)
                    .lineLimit(10)
                    .multilineTextAlignment(.leading)
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
            .background(scheme == .light ? .white : .black.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            .tint(.primary)
        }
    }
}
