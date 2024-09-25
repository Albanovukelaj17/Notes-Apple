//
//  ContentView.swift
//  Notes-App
//
//  Created by Albano Vukelaj on 24.09.24.
//

import SwiftUI

struct Note: Identifiable {
    let id = UUID()
    var title : String
    var content : String
}

struct ContentView: View {
    @State private var text = ""  // Der eingegebene Text

    var body: some View {
        VStack {
            Text("Enter your text below:")
                .font(.title)
                .foregroundColor(.white)  // Textfarbe weiß
                .padding()

            // Ein größeres Textfeld mit schwarzem Hintergrund, das so viel Platz wie möglich einnimmt
            TextEditor(text: $text)
                .foregroundColor(.white)  // Textfarbe weiß
                .background(Color.black)  // Hintergrundfarbe schwarz
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)  // Nimmt so viel Platz wie möglich ein
                .padding(.vertical)
                
               
        

            Spacer()  // Fügt Platz zwischen den Elementen hinzu
        }
        .padding()
        .background(Color.black)  // Hintergrund des gesamten Views schwarz
        .ignoresSafeArea()  // Deckt die gesamte Fläche ab, auch den Safe Area Bereich
    }
}

#Preview {
    ContentView()
}
