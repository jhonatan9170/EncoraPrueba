import UIKit

class DetailRouter: DetailWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(post: PostEntity) -> UIViewController {
        let view = DetailViewController()
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(interface: view, interactor: interactor, router: router, post: post)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
}
