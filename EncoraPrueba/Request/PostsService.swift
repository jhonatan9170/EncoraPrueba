
import Foundation

protocol PostsServiceProtocol{
    func requestToGetPosts(completion: @escaping ([PostModel]?) -> Void)
}
class PostsService: RequestManager {
}

extension PostsService: PostsServiceProtocol {
    func requestToGetPosts(completion: @escaping ([PostModel]?) -> Void) {
        let endpoint = Constants.postURL
        makeRequest(.get, model: PostsModel.self, endpoint: endpoint, successRequest: { response in
            completion(response.data)
        }) { _ in
            completion(nil)
        }
    }
}
