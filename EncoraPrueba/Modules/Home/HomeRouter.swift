import UIKit

class HomeRouter: HomeWireframeProtocol {

    weak var viewController: UIViewController?
    
    func showAlertWith(message: String) {
        let alert = UIAlertController(title: "Countries", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Aceptar", style: .default)
        alert.addAction(okAction)
        viewController?.present(alert, animated: true)
    }
    
    func goToDetailView(country: CountryModel) {
        if let nav = viewController?.navigationController {
            let vc = DetailAssembly.createModule(with: country.name.common)
            nav.pushViewController(vc, animated: true)
        }
    }
    
}
