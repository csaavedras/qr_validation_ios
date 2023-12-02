import SwiftUI

struct RoundedButton: View {
    var title: String
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(30)
            .padding(.horizontal, 10)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(title: "Sample Button", backgroundColor: .blue)
            .previewLayout(.sizeThatFits)
    }
}

