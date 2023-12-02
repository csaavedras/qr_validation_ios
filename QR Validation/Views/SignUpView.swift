import SwiftUI

struct SignUpView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Imagen
                Image(.qrValidatorMain) // Reemplaza con el nombre de tu imagen
                    .resizable()
                    .scaledToFit()
                    .frame(width: 233, height: 233)
                
                Spacer()
                
                // Título
                Text("Registro")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer().frame(height: 20)
                
                // Campos de registro
                VStack(spacing: 10) {
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                        TextField("Nombre", text: $name)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 10)
                            .foregroundColor(.primary)
                    }
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                    
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                        TextField("Correo electrónico", text: $email)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 10)
                            .foregroundColor(.primary)
                            .keyboardType(.emailAddress)
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
                    
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                        SecureField("Confirmar Contraseña", text: $confirmPassword)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 10)
                            .foregroundColor(.primary)
                    }
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                
                // Botón Crear Cuenta
                NavigationLink(destination: ContentView()) {
                    RoundedButton(title: "Crear cuenta", backgroundColor: .black)
                }
                
                Spacer().frame(height: 20)
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

