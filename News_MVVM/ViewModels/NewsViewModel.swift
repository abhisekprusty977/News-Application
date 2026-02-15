import Foundation

@MainActor
@Observable
class NewsViewModel {
    var article: Article = Article(data: [])
    var isLoading = false
    var errorMessage: String?
    
    private let APIKey = "GhWluR1oLClcHvSVno0WlvTTgLQPrh3sumrrto5l"
    //https://api.thenewsapi.com/v1/news/top?api_token=GhWluR1oLClcHvSVno0WlvTTgLQPrh3sumrrto5l&locale=us&limit=3
    
    
    init() {
        Task {
            await self.fetchHeadlines()
        }
    }
    
    func fetchHeadlines() async {
        defer {
            isLoading = false
        }
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://api.thenewsapi.com/v1/news/top?api_token=\(APIKey)&locale=us&limit=20")
        guard let url  else {
            errorMessage = "Invalid URL"
          
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedModel = try JSONDecoder().decode(Article.self, from: data)
            article = decodedModel
        } catch {
            errorMessage = "Unable to load News. Please try again."
            
        }
        
    }
}
