//
//  ContentView.swift
//  Notes-App
//
//  Created by Albano Vukelaj on 24.09.24.
//

import SwiftUI

struct ContentView: View {
    @State private var text = "Hello, world!"

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(text)
            Button(action: {
                text = "Button pressed!"
            }) {
                Text("Press Me")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
