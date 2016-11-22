import UIKit

class GenericTableViewDelegate: NSObject, UITableViewDelegate {

    var selectedRow: (Int) -> ()

    init(selectedRow: @escaping (Int) -> ()) {
        self.selectedRow = selectedRow
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow(indexPath.row)
    }

}
