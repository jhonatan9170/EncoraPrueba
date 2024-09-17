import UIKit

class DetailAssembly {
    static func createModule(with countryName: String) -> UIViewController {
        let view = DetailViewController()
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(interface: view, interactor: interactor, router: router, countryName: countryName)
                
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
