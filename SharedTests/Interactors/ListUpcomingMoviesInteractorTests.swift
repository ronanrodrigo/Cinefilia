import XCTest
@testable import Shared

class ListUpcomingMoviesInteractorTests: XCTestCase {

    var interactor: ListUpcomingMoviesInteractor!
    var presenter: ListUpcomingMoviesPresenterStub!
    var moviesGateway: MoviesGateway!
    var genresGateway: GenresGateway!
    var moviesWebService: WebServiceFake<[Movie]>!
    var genresWebService: WebServiceFake<[Genre]>!

    override func setUp() {
        moviesWebService = WebServiceFake()
        genresWebService = WebServiceFake()
        moviesGateway = MoviesGatewayWebService(webService: moviesWebService)
        genresGateway = GenresGatewayWebService(webService: genresWebService)
        presenter = ListUpcomingMoviesPresenterStub()
        interactor = ListUpcomingMoviesInteractor(moviesGateway: moviesGateway, genresGateway: genresGateway, presenter: presenter)
    }

    func testNotListMoviesWhenAnErrorOcurrsWhenGetGenresFromWebService() {
        genresWebService.error = ErrorFake.error

        interactor.list()

        XCTAssertEqual(0, presenter.movies.count)
        XCTAssertEqual(0, presenter.genres.count)
        XCTAssertNotNil(presenter.errorMessage)
    }

    func testNotListMoviesWhenAnErrorOcurrsWhenGetMoviesFromWebService() {
        moviesWebService.error = ErrorFake.error

        interactor.list()

        XCTAssertEqual(0, presenter.movies.count)
        XCTAssertEqual(0, presenter.genres.count)
        XCTAssertNotNil(presenter.errorMessage)
    }

    func testListMoviesWhenHasMovies() {
        moviesWebService.returnedEntity = [MovieEntity(
            id: 0,
            title: "",
            overview: "",
            releaseDate: Date(),
            posterPath: "",
            backDropPath: "",
            genresIds: [] )]

        interactor.list()

        XCTAssertTrue(presenter.movies.count > 0)
        XCTAssertNil(presenter.errorMessage)
    }

}
