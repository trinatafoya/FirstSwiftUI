//
//  ContentView.swift
//  FirstApp
//
//  Created by Katerina Tafoya on 12/14/25.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Image(systemName: "star")
                    .imageScale(.large)
                    .foregroundStyle(.cyan)
                Text("Hello, world!")
                Text("This is a fun thing.")
                
                // Menu buttons
                NavigationLink("Go to Profile", destination: ProfileView())
                    .buttonStyle(.borderedProminent)
                
                NavigationLink {
                    SettingsView()
                } label: {
                    Label("Open Settings", systemImage: "gearshape")
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .navigationTitle("Main Menu")
    }
}

struct SpaceItem: Identifiable, Hashable {
    let id = UUID()
    let value: Int
}

struct ProfileView: View {
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)

        ScrollView {
            VStack(spacing: 12) {
                Text("Profile")
                    .font(.largeTitle)
                Text("Space stuff is sweet")

                let items: [SpaceItem] = (0..<6).flatMap { i in [SpaceItem(value: i), SpaceItem(value: i)]}

                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(Array(items.shuffled().enumerated()), id: \.element.id) { index, item in
                        DelayedImage(name: "space\(item.value)", delay: .milliseconds(index*700))
                    }
                }

            }
            .padding()
        }
        .navigationTitle("Profile")
    }
}

struct DelayedImage: View {
    let name: String
    let delay: Duration
    
    @State private var isVisible = false
    var body: some View {
        Group {
            if isVisible {
                Image(name)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)        // take full cell width
                    .frame(width: 100, height: 100)
                    .clipped()                         // crop overflow from scaledToFill
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.quaternary)
                    .frame(width: 100, height: 100)
                    .background(Color.cyan)
                    .opacity(0.15)
                    .redacted(reason: .placeholder)
            }
        }
        .task {
            try? await Task.sleep(for: delay)
            withAnimation(.easeIn(duration: 0.25)) {
                isVisible = true
            }
        }
    }
}

struct SettingsView: View {
    var body: some View {
        List {
            Toggle("Enable Feature X", isOn: .constant(true))
            Toggle("Enable Feature Y", isOn: .constant(false))
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    ContentView()
}
