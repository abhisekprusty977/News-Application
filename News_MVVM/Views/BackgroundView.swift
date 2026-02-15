import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors:
                        [
                            Color.purple.opacity(0.5),
                            .blue.opacity(0.5)
                            ,
                            .red.opacity(0.5)
                        ],
                       startPoint: .topLeading, endPoint: .bottomTrailing
        )
        .blur(radius: 40)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
