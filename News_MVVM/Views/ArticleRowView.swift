import SwiftUI

struct ArticleRowView: View {
    let data: Datum
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: data.imageURL)!) {
                phase in
                switch phase {
                case .empty:
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(.thinMaterial)
                        .frame(width: 80, height: 80)
                        .overlay {
                            ProgressView()
                        }
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                case .failure(_):
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.thinMaterial)
                        .frame(width: 80, height: 80)
                        .overlay {
                            Image(systemName: "progress.indicator")
                        }
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading) {
                Text(data.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(data.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ArticleRowView(
        data: Datum(
            title: "Some title",
            description: "some descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome descsome desc",
            url: "sdfdsfsd",
            imageURL: "sdfdsfdsf",
            publishedAt: "sdfdsfs"
        )
    )
}
