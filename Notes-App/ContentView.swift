import SwiftUI

// Modell für eine einzelne Notiz
struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var filePath: URL  // Pfad der Notizdatei
}

struct ContentView: View {
    @State private var notes = [Note]()  // Eine leere Liste für Notizen
    @State private var selectedNote: Note?  // Die ausgewählte Notiz
    @State private var newContent: String = ""  // Neuer Inhalt für die ausgewählte Notiz

    var body: some View {
        NavigationView {
            // Linke Seite: Liste der Notizen
            List(notes) { note in
                Button(action: {
                    selectedNote = note  // Setzt die ausgewählte Notiz
                    loadNoteContent(note: note)  // Lädt den Inhalt der Notiz von der Festplatte
                }) {
                    Text(note.title)  // Zeigt den Titel der Notiz in der Liste an
                }
            }
            .navigationTitle("Notizen")
            .listStyle(SidebarListStyle())
            
            // Rechte Seite: Bearbeitbarer Inhalt der ausgewählten Notiz
            if let selectedNote = selectedNote {
                VStack {
                    Text("Bearbeite Notiz: \(selectedNote.title)")
                        .font(.headline)
                    
                    // TextEditor zum Bearbeiten des Inhalts
                    TextEditor(text: $newContent)  // Hier wird die veränderbare @State-Variable verwendet
                        .padding()
                        .border(Color.gray, width: 1)
                        .onChange(of: newContent) { newValue in
                            saveNoteContent(note: selectedNote)  // Speichert die Notiz automatisch bei jeder Änderung
                        }
                }
                .padding()
            } else {
                Text("Wähle eine Notiz aus")
                    .foregroundColor(.gray)
            }
        }
        .onAppear(perform: loadNotes)  // Lädt die Notizen beim Start der App
    }
    
    // Funktion zum Laden des Inhalts einer Notizdatei
    func loadNoteContent(note: Note) {
        do {
            let content = try String(contentsOf: note.filePath)
            newContent = content  // Setzt den Inhalt der ausgewählten Notiz
        } catch {
            print("Fehler beim Laden der Notiz: \(error)")
        }
    }
    
    // Funktion zum Speichern des Inhalts in die Notizdatei
    func saveNoteContent(note: Note) {
        do {
            try newContent.write(to: note.filePath, atomically: true, encoding: .utf8)
            print("Notiz automatisch gespeichert!")
        } catch {
            print("Fehler beim Speichern der Notiz: \(error)")
        }
    }
    
    // Funktion zum Laden von Notizen aus dem Dateisystem
    func loadNotes() {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]

        // Beispiel: 3 Notizdateien erstellen
        for i in 1...3 {
            let noteFile = documentsURL.appendingPathComponent("Note\(i).txt")
            let newNote = Note(title: "Notiz \(i)", content: "", filePath: noteFile)
            notes.append(newNote)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()  // Dies stellt sicher, dass die ContentView-Vorschau korrekt geladen wird
    }
}

