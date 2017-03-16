public class ListUpcomingMoviesInteractorFactory {

    public static func make(presenter: ListUpcomingMoviesPresenter) -> ListUpcomingMoviesInteractor {
        return ListUpcomingMoviesInteractor(
            moviesGateway: MoviesGatewayWebService(webService: WebServiceSession()),
            genresGateway: GenresGatewayWebService(webService: WebServiceSession()),
            presenter: presenter)
    }

}
