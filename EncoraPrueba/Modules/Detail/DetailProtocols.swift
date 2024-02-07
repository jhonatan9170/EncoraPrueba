import Foundation

//MARK: Presenter -> Router
protocol DetailWireframeProtocol: AnyObject {
}

//MARK: View -> Presenter
protocol DetailPresenterProtocol: AnyObject {
    var interactor: DetailInteractorInputProtocol? { get set }
    var post: PostEntity? {get set}
    func getDetail()
}

//MARK: Interactor -> Presenter
protocol DetailInteractorOutputProtocol: AnyObject {

}

//MARK: Presenter -> Interactor
protocol DetailInteractorInputProtocol: AnyObject {
    var presenter: DetailInteractorOutputProtocol?  { get set }

}

//MARK: Presenter -> View
protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol?  { get set }
    func updateView()
}

