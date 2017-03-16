public class GetMovieBackdropInteractorFactory {

    public static func make(presenter: GetMovieBackdropPresenter) -> GetMovieBackdropInteractor {
        return GetMovieBackdropInteractor(
            gateway: MoviesGatewayWebService(webService: WebServiceSession()),
            presenter: presenter)
    }

}
