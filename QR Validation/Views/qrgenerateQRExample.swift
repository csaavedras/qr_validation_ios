//
//  qrgenerateQRExample.swift
//  QR Validation
//
//  Created by Camilo Saavedra Salas on 01-12-23.
//

import SwiftUI

struct qrgenerateQRExample: View {
    
    @State private var text = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    var body: some View {
        VStack {
            TextField("Nombre", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Apellido", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Correo Electrónico", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Image(uiImage: UIImage(data: getQRCodeDate(text:text)!)!)
                .resizable()
                .frame(width: 200, height: 200)
        }
    }
    
    func getQRCodeDate(text: String) -> Data? {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        let data = text.data(using: .ascii, allowLossyConversion: false)
        filter.setValue(data, forKey: "inputMessage")
        guard let ciimage = filter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let uiimage = UIImage(ciImage: scaledCIImage)
        return uiimage.pngData()!
    }
 }

#Preview {
    qrgenerateQRExample()
}
