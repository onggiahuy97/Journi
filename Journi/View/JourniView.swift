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
    @State private var showTextEditor = false
    
    var body: some View {
        
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
        .background(Material.thin)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 5, y: 2)
        .padding(.horizontal)
        .tint(.primary)
        .onTapGesture {
            showTextEditor.toggle()
        }
        .sheet(isPresented: $showTextEditor) {
            NavigationView {
                TextEditor(text: $text)
                    .padding(.horizontal)
                    .scrollContentBackground(.hidden)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.gray.opacity(0.75), Color.gray.opacity(0.35)]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                        .opacity(0.35)
                    )
                    .background(.ultraThinMaterial)
                    .onAppear {
                        text = journi.content
                    }
                    .toolbar {
                        ToolbarItem {
                            Button("Done") {
                                journi.content = text
                                showTextEditor.toggle()
                            }
                            .tint(.white)
                        }
                    }
            }
        }
        
        
        
//        NavigationLink {
//            TextEditor(text: $text)
//                .navigationBarTitleDisplayMode(.inline)
//                .scrollContentBackground(.hidden)
//                .background(
//                    LinearGradient(
//                        gradient: Gradient(colors: [Color.gray.opacity(0.75), Color.gray.opacity(0.35)]),
//                        startPoint: .bottom,
//                        endPoint: .top
//                    )
//                    .opacity(0.75)
//                    , in: RoundedRectangle(cornerRadius: 8)
//                )
//                .padding()
//                .onAppear {
//                    text = journi.content
//                }
//                .onDisappear {
//                    journi.content = text
//                }
//            
//        } label: {
//            VStack(alignment: .leading) {
//                Text(journi.content)
//                    .lineLimit(10)
//                    .multilineTextAlignment(.leading)
//                Divider()
//                HStack {
//                    Text(journi.createdDate, format: .dateTime)
//                        .bold()
//                        .foregroundStyle(.secondary)
//                        .font(.caption)
//                    Spacer()
//                    Image(systemName: "ellipsis")
//                }
//            }
//            .padding()
//            .background(Material.thin)
//            .clipShape(RoundedRectangle(cornerRadius: 12))
//            .shadow(radius: 5, y: 2)
//            .padding(.horizontal)
//            .tint(.primary)
//            .onTapGesture {
//                showTextEditor.toggle()
//            }
//        }
    }
}
