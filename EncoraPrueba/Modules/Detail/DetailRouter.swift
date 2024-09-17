import UIKit

class DetailRouter: DetailWireframeProtocol {

    weak var viewController: UIViewController?
    
    func showAlertWith(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Aceptar", style: .default)
        alert.addAction(okAction)
        viewController?.present(alert, animated: true)
    }

}
