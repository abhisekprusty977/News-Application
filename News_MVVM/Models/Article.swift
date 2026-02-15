import Foundation

// MARK: - Article
class Article: Codable {
    
    let data: [Datum]?
    
    init(data: [Datum]?) {
        
        self.data = data
    }
}

// MARK: - Datum
class Datum: Codable, Identifiable {
    var id = UUID()
    let title, description: String
    let url: String
    let imageURL: String
    let publishedAt: String
    
    enum CodingKeys: String, CodingKey {
        case title, description, url
        case imageURL = "image_url"
        case publishedAt = "published_at"
    }
    
    init(title: String, description: String, url: String, imageURL: String, publishedAt: String) {
        self.title = title
        self.description = description
        self.url = url
        self.imageURL = imageURL
        self.publishedAt = publishedAt
    }
}
