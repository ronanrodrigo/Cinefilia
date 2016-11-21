import UIKit
import Shared

protocol ListUpcomingMoviesDelegate: class {

    func didList(movies: [Movie])
    func didLoad(genres: [Genre])
    func didDisplayError(message: String)
    func didGetAvatar(movie: Movie, image: UIImage)

}

class UpcomingMoviesViewController: UIViewController, ListUpcomingMoviesDelegate {

    private var cellIdentifier = String(describing: MovieTableViewCell.self)
    private var dataSource: GenericDataSource<Movie, MovieTableViewCell>?
    private var listUpcomingMoviesInteractor: ListUpcomingMoviesInteractor?
    private var getMovieBackdropInteractor: GetMovieBackdropInteractor?
    private var genres: [Genre] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        configureGetMovieBackdropInteractor()
        configureTableView()
        configureUpcomingMoviesInteractor()
        super.viewDidLoad()
    }

    private func configureGetMovieBackdropInteractor() {
        getMovieBackdropInteractor = GetMovieBackdropInteractorFactory.make(
            presenter: GetMovieBackdropPresenteriOS(delegate: self))
    }

    private func configureTableView() {
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
        dataSource = GenericDataSource() { (movie, cell) in
            cell.configure(movie: movie)
            let movieGenres = self.genres.filter({ movie.genresIds.contains($0.id) })
            cell.configure(genres: movieGenres)
            guard let dataSource = self.dataSource, let image = dataSource.images[movie.id] else {
                self.getMovieBackdropInteractor?.get(movie: movie)
                return
            }
            cell.configure(image: image)
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

    func didLoad(genres: [Genre]) {
        self.genres = genres
    }

    func didGetAvatar(movie: Movie, image: UIImage) {
        guard let dataSource = dataSource,
            let rowToReload = dataSource.objects.index(where: {$0.id == movie.id})
            else { return }
        dataSource.images[movie.id] = image
        self.tableView.reloadRows(at: [IndexPath.init(row: rowToReload, section: 0)], with: .none)
    }

    func didDisplayError(message: String) {
    }

}
