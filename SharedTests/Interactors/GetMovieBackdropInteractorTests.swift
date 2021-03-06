import XCTest
@testable import Shared

class GetMovieBackdropInteractorTests: XCTestCase {

    var interactor: GetMovieBackdropInteractor!
    var gateway: MoviesGateway!
    var presenter: GetMovieBackdropPresenterStub!
    var webService: WebServiceFake<Data>!
    var movie: MovieEntity!

    override func setUp() {
        presenter = GetMovieBackdropPresenterStub()
        webService = WebServiceFake()
        gateway = MoviesGatewayWebService(webService: webService)
        interactor = GetMovieBackdropInteractor(gateway: gateway, presenter: presenter)
        movie = MovieEntity(
            id: 0,
            title: "",
            overview: "",
            releaseDate: Date(),
            posterPath: "",
            backDropPath: "/some",
            genresIds: [])
        super.setUp()
    }

    func testNotShowImageWhenDataIsNone() {
        interactor.get(movie: movie)

        XCTAssertNil(presenter.imageData)
        XCTAssertNil(presenter.movie)
    }

    func testNotShowImageWhenAvatarUrlIsNone() {
        movie.backDropPath = ""

        interactor.get(movie: movie)

        XCTAssertNil(presenter.imageData)
        XCTAssertNil(presenter.movie)
    }

    func testShowImageWhenAvatarDataIsSome() {
        webService.returnedEntity = Data()

        interactor.get(movie: movie)

        XCTAssertNotNil(presenter.imageData)
        XCTAssertNotNil(presenter.movie)
    }

}
