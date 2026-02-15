import SwiftUI
import WebKit

struct NewsHeadLinesView: View {
    
    var vm: NewsViewModel = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                List {
                    
                    if vm.errorMessage == nil {
                        if let modelArr = vm.article.data {
                            ForEach(
                                modelArr
                            ) { (
                                newsModel
                            ) in
                                
                                NavigationLink {
                                    WebView(url: URL(string:newsModel.url)!)
                                } label: {
                                    ArticleRowView(data: newsModel)
                                }
                                
                                
                                
                            }
                        }
                    }else {
                        Text(
                            vm.errorMessage ?? ""
                        )
                    }
                    
                }
                .scrollContentBackground(
                    .hidden
                )   // iOS 16+
                .background(
                    Color.clear
                )
                if vm.isLoading {
                    ProgressView(
                        "Loading...."
                    )
                    .font(.headline)
                    .padding()
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10.0))
                    
                }
            }
            .alert(
                "Error",
                isPresented: .constant(
                    vm.errorMessage != nil
                ),
                actions: {
                    Button(
                        "OK"
                    ){
                        vm.errorMessage = nil
                    }
                },
                message: {
                    Text(vm.errorMessage ?? "")
                }
            )
            .navigationTitle(
                "Top Headlines"
            )
            .refreshable {
                await vm
                    .fetchHeadlines()
            }
        }
    }
}



#Preview {
    NewsHeadLinesView()
}

