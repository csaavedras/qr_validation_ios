import SwiftUI

// Hacer la estructura Event pública
public struct Event: Identifiable {
    public var id = UUID()
    var name: String
    var date: Date
    var attendeesCount: Int
}

struct EventListView: View {
    // Lista de eventos de ejemplo
    let events: [Event] = [
        Event(name: "Evento 1", date: Date(), attendeesCount: 150),
        Event(name: "Evento 2", date: Date(), attendeesCount: 300),
        Event(name: "Evento 3", date: Date(), attendeesCount: 50)
    ]

    var body: some View {
        NavigationView {
            List(events) { event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Nombre: \(event.name)")
                        Text("Fecha: \(formattedDate(event.date))")
                        Text("Asistentes: \(event.attendeesCount)")
                    }
                }
            }
            .navigationBarTitle("Lista de Eventos")
        }
    }

    // Función para formatear la fecha
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct EventDetailView: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Nombre: \(event.name)")
                .font(.title)
            Text("Fecha: \(formattedDate(event.date))")
            Text("Asistentes: \(event.attendeesCount)")
        }
        .padding()
        .navigationBarTitle("Detalle del Evento")
    }

    // Función para formatear la fecha
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}

