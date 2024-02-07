import UIKit

class DetailPresenter {
    
    weak private var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    private let router: DetailWireframeProtocol
    
    var post: PostEntity?
    
    init(interface: DetailViewProtocol, interactor: DetailInteractorInputProtocol?, router: DetailWireframeProtocol, post:PostEntity) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.post = post
       
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    func getDetail(){
        self.view?.updateView()
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {

}
