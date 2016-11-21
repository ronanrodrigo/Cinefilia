import UIKit
import Shared

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var backdrop: UIImageView!
    @IBOutlet weak var genresImages: UIStackView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var backdropPlaceholder: UIView!

    func configure(movie: Movie) {
        title.text = movie.title.uppercased()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        releaseDate.text = dateFormatter.string(from: movie.releaseDate)
    }

    func configure(image: UIImage) {
        backdrop.image = image
        backdropPlaceholder.isHidden = true
    }

    func configure(genres: [Genre]) {
        for genre in genres {
            let genreImage = UIImage(named: genre.name)
            let genreImageView = UIImageView(image: genreImage)
            genreImageView.contentMode = UIViewContentMode.scaleAspectFit
            genresImages.addArrangedSubview(genreImageView)
        }
        genresImages.arrangedSubviews
            .filter({$0.isHidden})
            .forEach(genresImages.removeArrangedSubview)
    }

    override func prepareForReuse() {
        backdrop.image = #imageLiteral(resourceName: "Movie")
        backdropPlaceholder.isHidden = false
        genresImages.arrangedSubviews.forEach({$0.isHidden = true})
    }

}
