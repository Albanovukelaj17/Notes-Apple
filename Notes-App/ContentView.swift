//
//  ContentView.swift
//  Notes-App
//
//  Created by Albano Vukelaj on 24.09.24.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""  // Der eingegebene Text

    var body: some View {
        VStack {
            Text("Enter your text below:")
                .font(.title)  // Titeltext für das Label
                .padding()

            // Ein größeres Textfeld für die Eingabe
            TextEditor(text: $text)
                .frame(height: 200)  // Die Höhe des Textfelds
                .padding()
                .border(Color.gray, width: 1)  // Rahmen um das Textfeld

            // Der eingegebene Text wird hier angezeigt
            Text("Your input:")
                .font(.headline)
                .padding(.top)
            Text(text)  // Zeigt den eingegebenen Text an
                .padding()
                .background(Color.gray.opacity(0.2))  // Verwende stattdessen Color.gray mit Opazität
                .cornerRadius(8)

            Spacer()  // Fügt Platz zwischen den Elementen hinzu
        }
        .padding()  // Fügt allgemeines Padding um den gesamten VStack hinzu
    }
}

#Preview {
    ContentView()
}
