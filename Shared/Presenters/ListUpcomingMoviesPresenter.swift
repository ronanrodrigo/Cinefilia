public protocol ListUpcomingMoviesPresenter: class {

    func displayMovies(movies: [Movie])
    func loadGenres(genres: [Genre])
    func displayError(message: String)

}
