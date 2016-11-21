public protocol GenresGateway {

    func list(page: Int, completion: @escaping ([Genre]?, Error?) -> ())

}


public class GenresGatewayWebService: GenresGateway {

    private var webService: WebService

    public init(webService: WebService) {
        self.webService = webService
    }

    public func list(page: Int, completion: @escaping ([Genre]?, Error?) -> ()) {
        webService.load(resource: Resources.moviesGenres(), completion: { repositories, error in
            completion(repositories, error)
        })
    }

}
