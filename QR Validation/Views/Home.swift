//
//  ContentView.swift
//  QR Validation
//
//  Created by Camilo Saavedra Salas on 29-11-23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
                    VStack {
                        // Títulos y Logo
                        Spacer()
                        Text("QR Validation")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Crea, organiza y valida todos tus próximos eventos con QR Validation")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        // Logo de la aplicación (puedes reemplazar Image("Logo") con el nombre de tu imagen)
                        Image(.qrValidatorMain)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 233, height: 233)
                        
                        Spacer()
                        
                        // Botones de Iniciar Sesión y Registrarse
                        VStack {
                            NavigationLink(destination: SignInView()) {
                                RoundedButton(title: "Iniciar Sesión", backgroundColor: .black)

                            }
                            
                            NavigationLink(destination: SignUpView()) {
                                RoundedButton(title: "Registrate", backgroundColor: .black)

                            }
                            
                        }
                        .padding(.bottom, 50)
                    }
                    .padding()
                    .navigationBarHidden(true) // Oculta la barra de navegación
                }
    }
}

#Preview {
    Home()
}

