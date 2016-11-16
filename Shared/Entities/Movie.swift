public protocol Movie {
    var id: Int { get }
    var title: Int { get }
    var overview: String { get }
    var releaseDate: Date { get }
    var posterPath: URL { get }
    var popularity: Float { get }
}

public struct MovieEntity: Movie {
    public var id: Int
    public var overview: String
    public var popularity: Float
    public var posterPath: URL
    public var releaseDate: Date
    public var title: Int
    
    public init(id: Int, overview: String, popularity: Float, posterPath: URL, releaseDate: Date, title: Int) {
        self.id = id
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
    }
}
