//
//  ContentView.swift
//  FirstApp
//
//  Created by Katerina Tafoya on 12/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Image(systemName: "star")
                .imageScale(.large)
                .foregroundStyle(.cyan)
            Text("Hello, world!")
            Text("This kind of takes forever \n Oh well it is getting faster... well")
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
