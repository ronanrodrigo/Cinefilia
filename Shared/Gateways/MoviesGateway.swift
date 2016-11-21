public protocol MoviesGateway {

    func list(page: Int, completion: @escaping ([Movie]?, Error?) -> ())

}

public class MoviesGatewayWebService: MoviesGateway {

    private var webService: WebService

    public init(webService: WebService) {
        self.webService = webService
    }

    public func list(page: Int, completion: @escaping ([Movie]?, Error?) -> ()) {
        webService.load(resource: Resources.upcomingMovies(page: page), completion: { repositories, error in
            completion(repositories, error)
        })
    }

}
