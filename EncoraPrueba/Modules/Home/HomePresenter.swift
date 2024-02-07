import UIKit

class HomePresenter {
    
    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    private let router: HomeWireframeProtocol
    
    private var _postToShow = [PostEntity]()
    private var posts = [PostEntity]()

    
    init(interface: HomeViewProtocol, interactor: HomeInteractorInputProtocol?, router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresenterProtocol {
    var postsToShow: [PostEntity] {
        return _postToShow
    }
        
    func getPosts() {
        interactor?.loadPost()
    }
    
    func filterByTitle(text: String) {
        self._postToShow = posts.filter { $0.title.lowercased().contains(text.lowercased()) }
        view?.showPosts()
    }
    
    func cleanFilter() {
        _postToShow = posts
        view?.showPosts()
    }
    
    func postForCellAtIndex(_ index: Int) -> PostEntity {
        return _postToShow[index]
    }
    
    func goToDetailView(withIndex index: Int) {
        let post = _postToShow[index]
        router.goToDetailView(post: post)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func postListDidFetch(postList: [PostModel]) {
        posts =  postList.map{$0.postEntity}
        _postToShow = posts
        view?.showPosts()
    }
    
    func postListFailed(error: String) {
        router.showAlertWith(message: error)
    }
}
