import XCTest
@testable import Shared

class GenreEntityTests: EntityTestCase {

    var genresDictionary: JSONDictionary!

    override func setUp() {
        super.setUp()
        genresDictionary = loadJson(resource: "Genres")
    }

    func testConvertJSONDictionaryToGenreEntity() {
        let genres = genresDictionary["genres"] as! [JSONDictionary]
        let createdGenres = genres.flatMap(GenreEntity.init)

        XCTAssertEqual(1, createdGenres.count)
    }

}
