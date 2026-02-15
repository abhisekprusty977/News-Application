import SwiftUI

struct AppSplashView: View {
    @State private var isActive: Bool = true
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 24) {
                Image(systemName: "newspaper.fill")
                    .symbolRenderingMode(.hierarchical)
                    .font(.system(size: 72, weight: .bold))
                    .foregroundStyle(.white)
                    .scaleEffect(isAnimating ? 1.0 : 0.8)
                    .opacity(isAnimating ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 0.8), value: isAnimating)
                Text("Top Headlines")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .opacity(isAnimating ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 0.6).delay(0.2), value: isAnimating)
                ProgressView()
                    .tint(.white)
                    .scaleEffect(1.2)
                    .opacity(isAnimating ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 0.6).delay(0.4), value: isAnimating)
            }
            .padding()
        }
        .onAppear {
            isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    isActive = false
                }
            }
        }
    }
}

#Preview {
    AppSplashView()
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content
    
    init(_ initialValue: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: initialValue)
        self.content = content
    }
    
    var body: some View {
        content($value)
    }
}

