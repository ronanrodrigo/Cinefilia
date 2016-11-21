import UIKit
import Shared

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var backdrop: UIImageView!
    @IBOutlet weak var genresImages: UIStackView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var backdropPlaceholder: UIView!

    public func configure(movie: Movie) {
        title.text = movie.title.uppercased()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        releaseDate.text = dateFormatter.string(from: movie.releaseDate)
    }

    func configure(image: UIImage) {
        backdrop.image = image
        backdropPlaceholder.isHidden = true
    }

    override func prepareForReuse() {
        backdrop.image = #imageLiteral(resourceName: "Movie")
        backdropPlaceholder.isHidden = false
    }

}
