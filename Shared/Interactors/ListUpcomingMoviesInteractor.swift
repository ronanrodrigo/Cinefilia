public class ListUpcomingMoviesInteractor {

    private var moviesGateway: MoviesGateway
    private var genresGateway: GenresGateway
    private var presenter: ListUpcomingMoviesPresenter

    public init(moviesGateway: MoviesGateway, genresGateway: GenresGateway, presenter: ListUpcomingMoviesPresenter) {
        self.moviesGateway = moviesGateway
        self.genresGateway = genresGateway
        self.presenter = presenter
    }

    public func list() {

    }

}
