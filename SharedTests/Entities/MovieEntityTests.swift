import XCTest
@testable import Shared

class MovieEntityTests: XCTestCase {

    var movieDictionary: JSONDictionary!

    override func setUp() {
        super.setUp()
        if let path = Bundle.main.path(forResource: "Movies", ofType: "json"),
            let jsonNSData = try? NSData(contentsOfFile: path, options: .dataReadingMapped) {
            let jsonData = jsonNSData as Data
            if let movieDictionaryFromJson: JSONDictionary = (try? JSONSerialization.jsonObject(with: jsonData, options: [])) as? JSONDictionary {
                movieDictionary = movieDictionaryFromJson
            }
        }
    }

    func testConvertJSONDictionaryToMovieEntity() {
        let movies = movieDictionary["results"] as! [JSONDictionary]
        let createdMovies = movies.flatMap(MovieEntity.init)

        XCTAssertEqual(1, createdMovies.count)
    }

}
