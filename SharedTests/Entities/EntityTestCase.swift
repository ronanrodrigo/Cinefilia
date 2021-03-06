import XCTest
@testable import Shared

class EntityTestCase: XCTestCase {

    func loadJson(resource: String) -> JSONDictionary? {
        if let path = Bundle.main.path(forResource: resource, ofType: "json"),
            let jsonNSData = try? NSData(contentsOfFile: path, options: .dataReadingMapped) {
            let jsonData = jsonNSData as Data
            if let dictionaryFromJson: JSONDictionary = (try? JSONSerialization.jsonObject(with: jsonData, options: [])) as? JSONDictionary {
                return dictionaryFromJson
            }
        }
        return nil
    }

}
