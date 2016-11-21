import UIKit
import Shared

protocol ListUpcomingMoviesDelegate {

    func didList(movies: [Movie])
    func didDisplayError(message: String)

}

class UpcomingMoviesViewController: UIViewController, ListUpcomingMoviesDelegate {

    private var cellIdentifier = String(describing: MovieTableViewCell.self)
    private var dataSource: GenericDataSource<Movie, MovieTableViewCell>?
    private var listUpcomingMoviesInteractor: ListUpcomingMoviesInteractor?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        configureTableView()
        configureUpcomingMoviesInteractor()
        super.viewDidLoad()
    }

    private func configureTableView() {
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
        dataSource = GenericDataSource() { (movie, cell) in
            cell.configure(movie: movie)
        }
        tableView.dataSource = dataSource
    }

    private func configureUpcomingMoviesInteractor() {
        listUpcomingMoviesInteractor = ListUpcomingMoviesInteractorFactory.make(
            presenter: ListUpcomingMoviesPresenteriOS(delegate: self))
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        listUpcomingMoviesInteractor?.list()
    }

    func didList(movies: [Movie]) {
        guard let dataSource = dataSource else { return }
        dataSource.objects = dataSource.objects + movies
        tableView.reloadData()
    }

    func didDisplayError(message: String) {
    }

}
