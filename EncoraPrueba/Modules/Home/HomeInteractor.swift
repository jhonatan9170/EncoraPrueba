import UIKit

class HomeInteractor: HomeInteractorInputProtocol {

    weak var presenter: HomeInteractorOutputProtocol?
    
    var postsService: PostsServiceProtocol = PostsService()
    
    
    func loadPost() {
        postsService.requestToGetPosts { [weak self] posts in
            if let posts {
                self?.presenter?.postListDidFetch(postList: posts)
            } else {
                self?.presenter?.postListFailed(error: "Post no fueron cargados")
            }
        }
    }
    
}
