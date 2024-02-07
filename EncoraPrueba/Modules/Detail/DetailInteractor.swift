import UIKit

class DetailInteractor: DetailInteractorInputProtocol {

    weak var presenter: DetailInteractorOutputProtocol?
    
    var postsService: PostsServiceProtocol = PostsService()
    
}
