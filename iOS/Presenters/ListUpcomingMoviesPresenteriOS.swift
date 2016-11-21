import Shared

class ListUpcomingMoviesPresenteriOS: ListUpcomingMoviesPresenter {

    var delegate: ListUpcomingMoviesDelegate

    init(delegate: ListUpcomingMoviesDelegate) {
        self.delegate = delegate
    }

    func loadGenres(genres: [Genre]) {
    }

    func displayMovies(movies: [Movie]) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.delegate.didList(movies: movies)
        }
    }

    func displayError(message: String) {
    }

}
