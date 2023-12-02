import SwiftUI

struct CreateEventView: View {
    @State private var eventName = ""
    @State private var eventLocation = ""
    @State private var eventDate = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var attendeesCount = ""
    @State private var eventType = EventType.free
    
    enum EventType: String, CaseIterable {
        case free = "Gratuito"
        case paid = "Pago"
    }

    var body: some View {
        Form {
            Section(header: Text("Detalles del Evento")) {
                TextField("Nombre del Evento", text: $eventName)
                TextField("Dirección", text: $eventLocation)
                DatePicker("Fecha", selection: $eventDate, displayedComponents: [.date])
                DatePicker("Hora de Inicio", selection: $startTime, displayedComponents: [.hourAndMinute])
                DatePicker("Hora de Término", selection: $endTime, displayedComponents: [.hourAndMinute])
                TextField("Cantidad de Asistentes", text: $attendeesCount)
                    .keyboardType(.numberPad)
                Picker("Tipo de Evento", selection: $eventType) {
                    ForEach(EventType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Section {
                Button(action: {
                    // Agregar lógica para crear el evento
                }) {
                    Text("Crear Evento")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarTitle("Crear Evento")
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}

