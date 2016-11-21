public protocol GenresGateway {

    func list(completion: @escaping ([Genre]?, Error?) -> ())

}

public class GenresGatewayWebService: GenresGateway {

    private var webService: WebService

    public init(webService: WebService) {
        self.webService = webService
    }

    public func list(completion: @escaping ([Genre]?, Error?) -> ()) {
        webService.load(resource: Resources.moviesGenres(), completion: { genres, error in
            completion(genres, error)
        })
    }

}
