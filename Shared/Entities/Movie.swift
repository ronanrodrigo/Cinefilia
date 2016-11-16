public protocol Movie {
    var id: Int { get }
    var title: Int { get }
    var overview: String { get }
    var releaseDate: Date { get }
    var posterPath: String { get }
    var backDropPath: String { get }
    var genres: [Genre] { get }
}

public struct MovieEntity: Movie {
    public var id: Int
    public var title: Int
    public var overview: String
    public var releaseDate: Date
    public var posterPath: String
    public var backDropPath: String
    public var genres: [Genre]
    
    public init(id: Int, title: Int, overview: String, releaseDate: Date, posterPath: String, backDropPath: String, genres: [Genre]) {
        self.id = id
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterPath = posterPath
        self.backDropPath = backDropPath
        self.genres = genres
    }
}
