import Foundation

//MARK: Presenter -> Router
protocol HomeWireframeProtocol: AnyObject {
    func showAlertWith(message: String)
    func goToDetailView(post: PostEntity)
}

//MARK: View -> Presenter
protocol HomePresenterProtocol: AnyObject {
    var interactor: HomeInteractorInputProtocol? { get set }
    var postsToShow: [PostEntity] {get set}
    
    func getPosts()
    func filterByTitle(text: String)
    func cleanFilter()
    func postForCellAtIndex(_ index : Int) -> PostEntity
    func goToDetailView(withIndex index: Int)
}

//MARK: Interactor -> Presenter
protocol HomeInteractorOutputProtocol: AnyObject {
    func postListDidFetch(postList: [PostModel])
    func postListFailed(error:String)
}

//MARK: Presenter -> Interactor
protocol HomeInteractorInputProtocol: AnyObject {
    var presenter: HomeInteractorOutputProtocol?  { get set }
    func loadPost()
}

//MARK: Presenter -> View
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol?  { get set }
    func showPosts()
}


