import SwiftUI

struct QRCodeResultView: View {
    var qrCodeImage: Image
    var details: String

    var body: some View {
        VStack {
            Spacer()

            qrCodeImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()

            Text("Detalles del Asistente:")
                .font(.headline)
                .padding()

            Text(details)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        .navigationBarTitle("Código QR Generado")
    }
}

struct QRCodeResultView_Previews: PreviewProvider {
    static var previews: some View {
        // Aquí deberías pasar una imagen y detalles reales o de prueba
        QRCodeResultView(qrCodeImage: Image(systemName: "qrcode"), details: "Nombre: Juan Pérez\nCorreo: juan@example.com\nEvento: Evento 1")
    }
}

