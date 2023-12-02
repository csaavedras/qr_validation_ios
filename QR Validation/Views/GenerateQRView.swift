import SwiftUI
import CoreImage.CIFilterBuiltins

struct GenerateQRView: View {
    // Estructura de ejemplo para un evento
    struct Event {
        var name: String
        var date: Date
    }
    
    // Lista de eventos de ejemplo
    let events: [Event] = [
        Event(name: "Evento 1", date: Date()),
        Event(name: "Evento 2", date: Date()),
        Event(name: "Evento 3", date: Date())
    ]
    
    // Estados para el formulario
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var selectedEventIndex = 0
    @State private var generatedQRCode: String?
    @State private var qrCodeImage: Image?
    @State private var isGeneratingQRCode = false
    @State private var showQRCodeView = false
    @State private var generateQRProgress = 0.0

    
    var body: some View {
        NavigationView {
            // Use un VStack para envolver las vistas y manejar la navegación de manera más efectiva
            VStack {
                Form {
                    Section(header: Text("Detalles del Asistente")) {
                        TextField("Nombre", text: $firstName)
                        TextField("Apellido", text: $lastName)
                        TextField("Correo Electrónico", text: $email)
                    }
                    
                    Section(header: Text("Seleccionar Evento")) {
                        Picker("Evento", selection: $selectedEventIndex) {
                            ForEach(0..<events.count) { index in
                                Text(events[index].name)
                            }
                            // Añadir una fila vacía para el caso de "ningún evento seleccionado"
                            EmptyView()
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    Button(action: {
                        isGeneratingQRCode = true
                        // Agregar un retraso de 2 segundos antes de la generación del código QR
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            generateQRCode()
                            showQRCodeView = true
                        }
                    }) {
                        Text("Generar Códigos QR")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding() // Añadir padding al botón en sí
                    }
                }
                .navigationBarTitle("Generar Códigos QR")
            
                
                // Agregar una vista condicional para mostrar la barra de progreso
                if isGeneratingQRCode {
                    ProgressView("Generando Código QR...")
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding()
                }
            }
            .background(
                // Use una navegación de destino directo al generar el código QR
                NavigationLink(
                    destination: QRCodeResultView(qrCodeImage: qrCodeImage ?? Image(systemName: "photo"), details: userDetails()),
                    isActive: $showQRCodeView,
                    label: { EmptyView() }
                )                .hidden()
            )
        }
    }
    
    func generateQRCode() {
        let uniqueCode = UUID().uuidString
        let qrInfo = "\(firstName) \(lastName)\n\(email)\n\(events[selectedEventIndex].name)\n\(uniqueCode)"
        
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else {
            isGeneratingQRCode = false
            return
        }
        
        let data = qrInfo.data(using: .ascii, allowLossyConversion: false)
        filter.setValue(data, forKey: "inputMessage")
        
        if let ciImage = filter.outputImage {
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let scaledCIImage = ciImage.transformed(by: transform)
            let uiImage = UIImage(ciImage: scaledCIImage)
            qrCodeImage = Image(uiImage: uiImage)
        }
        
        isGeneratingQRCode = false
    }
    
    // Función para obtener los detalles del usuario
    private func userDetails() -> String {
        return """
            Nombre: \(firstName) \(lastName)
            Correo Electrónico: \(email)
            Evento: \(events[selectedEventIndex].name)
            """
    }
}

struct GenerateQRView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateQRView()
    }
}

