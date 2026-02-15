import SwiftUI

@main
struct News_MVVMApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
struct RootView: View {
    @State private var showSplash = true

    var body: some View {
        Group {
            if showSplash {
                AppSplashView()
                    .transition(.opacity)
            } else {
                NewsHeadLinesView()
                    .transition(.opacity)
            }
        }
        .onAppear {
            // Simulate a short splash duration; adjust as needed
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut(duration: 0.4)) {
                    showSplash = false
                }
            }
        }
    }
}

