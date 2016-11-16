public protocol Genre {
    var id: Int { get }
    var name: String { get }
}

public struct GenreEntity: Genre {
    public var id: Int
    public var name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
