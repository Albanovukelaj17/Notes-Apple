import SwiftUI

// Modell für eine einzelne Notiz
struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
}

struct ContentView: View {
    // Liste der Notizen (Beispielinhalt)
    @State private var notes = [
        Note(title: "Notiz 1", content: "Das ist der Inhalt von Notiz 1."),
        Note(title: "Notiz 2", content: "Das ist der Inhalt von Notiz 2."),
        Note(title: "Notiz 3", content: "Das ist der Inhalt von Notiz 3.")
    ]
    
    // Die aktuell ausgewählte Notiz
    @State private var selectedNote: Note?

    var body: some View {
        NavigationView {
            // Linke Seite: Liste der Notizen
            List(notes) { note in
                Button(action: {
                    selectedNote = note  // Setzt die ausgewählte Notiz
                }) {
                    Text(note.title)  // Zeigt den Titel der Notiz in der Liste an
                        .font(.headline)
                }
            }
            .listStyle(SidebarListStyle())  // Stellt sicher, dass die Liste wie eine Seitenleiste aussieht
            .navigationTitle("Notizen")  // Titel der Liste

            // Rechte Seite: Der Inhalt der ausgewählten Notiz
            if let selectedNote = selectedNote {
                VStack(alignment: .leading) {
                    Text(selectedNote.title)  // Titel der Notiz
                        .font(.largeTitle)
                        .padding(.bottom, 10)
                    Text(selectedNote.content)  // Inhalt der Notiz
                        .font(.body)
                }
                .padding()
                .navigationTitle(selectedNote.title)  // Titel für das rechte Panel
            } else {
                Text("Wähle eine Notiz aus")
                    .foregroundColor(.gray)
                    .navigationTitle("Notizinhalt")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()  // Dies stellt sicher, dass die ContentView-Vorschau korrekt geladen wird
    }
}

