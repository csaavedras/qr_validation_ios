import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CreateEventView()) {
                    DashboardRow(title: "Crear Evento", systemImage: "calendar.badge.plus", color: .blue)
                }

                NavigationLink(destination: EventListView()) {
                    DashboardRow(title: "Lista de Eventos", systemImage: "list.bullet", color: .green)
                }

                NavigationLink(destination: GenerateQRView()) {
                    DashboardRow(title: "Generar Código QR", systemImage: "qrcode", color: .orange)
                }

                NavigationLink(destination: InvitePeopleView()) {
                    DashboardRow(title: "Invitar Personas", systemImage: "person.2.square.stack.fill", color: .purple)
                }

                NavigationLink(destination: ValidateQRView()) {
                    DashboardRow(title: "Validar Código QR", systemImage: "checkmark.square.fill", color: .red)
                }
              
            }
            .listStyle(InsetGroupedListStyle()) // Estilo de lista con espacio alrededor de los elementos
            .navigationBarTitle("Dashboard")
            
        }
    }
}

struct ContentRow: View {
    var title: String
    var systemImage: String
    var color: Color

    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(color)
                .padding()

            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            Spacer()
        }
        .padding(.vertical, 10)
    }
}



struct InvitePeopleView: View {
    var body: some View {
        Text("Invitar Personas")
            .navigationBarTitle("Invitar Personas")
    }
}

struct ValidateQRView: View {
    var body: some View {
        Text("Validar Código QR")
            .navigationBarTitle("Validar Código QR")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}


