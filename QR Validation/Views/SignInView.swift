import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Imagen
                Image(.qrValidatorMain) 
                    .resizable()
                    .scaledToFit()
                    .frame(width: 233, height: 233)
                
                Spacer()
                
                // Título
                Text("Inicio de sesión")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer().frame(height: 20)
                
                // Inputs de Correo Electrónico y Contraseña
                VStack(spacing: 10) {
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                        TextField("Correo electrónico", text: $email)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 10)
                            .foregroundColor(.primary)
                    }
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                    
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                        SecureField("Contraseña", text: $password)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 10)
                            .foregroundColor(.primary)
                    }
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                }
                .padding(.horizontal, 20)
                
                Spacer().frame(height: 10)
                
                // ¿Olvidaste tu contraseña?
                Button(action: {
                    // Agregar lógica para el olvido de contraseña
                }) {
                    Text("¿Olvidaste tu contraseña?")
                        .foregroundColor(.blue)
                        .font(.subheadline)
                }
                
                Spacer()
                
                // Botón Iniciar Sesión
                Button(action: {
                    // Agregar lógica para iniciar sesión
                }) {
                    RoundedButton(title: "Iniciar Sesión", backgroundColor: .black)
                }
                
                Spacer().frame(height: 20)
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

