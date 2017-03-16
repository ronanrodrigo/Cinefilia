import XCTest
@testable import Shared

class MovieEntityTests: EntityTestCase {

    var movieDictionary: JSONDictionary!

    override func setUp() {
        super.setUp()
        movieDictionary = loadJson(resource: "Movies")
    }

    func testConvertJSONDictionaryToMovieEntity() {
        let movies = movieDictionary["results"] as! [JSONDictionary]
        let createdMovies = movies.flatMap(MovieEntity.init)

        XCTAssertEqual(1, createdMovies.count)
    }

}
