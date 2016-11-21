import Shared

class MoviesRouterNavigation: MoviesRouter {

    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func root() {
        let upcomingMoviesViewController = UpcomingMoviesViewController()
        addTitleInNavigation(at: upcomingMoviesViewController, with: "UPCOMING MOVIES")
        navigationController.viewControllers = [upcomingMoviesViewController]
    }

    func movieDetail(movie: Movie) {
    }

    private func addTitleInNavigation(at viewController: UIViewController, with text: String) {
        viewController.navigationItem.title = text
    }

}
