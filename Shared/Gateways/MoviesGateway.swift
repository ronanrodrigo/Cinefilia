public protocol MoviesGateway {

    func list(page: Int, completion: @escaping ([Movie]?, Error?) -> ())
    func getBackdrop(path: String, completion: @escaping (Data?) -> ())

}

public class MoviesGatewayWebService: MoviesGateway {

    private var webService: WebService

    public init(webService: WebService) {
        self.webService = webService
    }

    public func list(page: Int, completion: @escaping ([Movie]?, Error?) -> ()) {
        webService.load(resource: Resources.upcomingMovies(page: page), completion: { movies, error in
            completion(movies, error)
        })
    }

    public func getBackdrop(path: String, completion: @escaping (Data?) -> ()) {
        webService.download(url: Resources.movieBackdrop(path: path)) { data in
            completion(data)
        }
    }

}
