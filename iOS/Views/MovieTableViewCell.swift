import UIKit
import Shared

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var backdrop: UIImageView!
    @IBOutlet weak var genresImages: UIStackView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var title: UILabel!

    public func configure(movie: Movie) {
        title.text = movie.title.uppercased()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        releaseDate.text = dateFormatter.string(from: movie.releaseDate)
    }

}
