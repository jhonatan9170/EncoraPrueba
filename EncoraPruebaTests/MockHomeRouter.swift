
import Foundation
@testable import EncoraPrueba

class MockHomeRouter: HomeWireframeProtocol {
    var goToDetailViewCalled = false
    var shoeAlert = false
    var messageAlert = ""
    var post:PostEntity?
    func goToDetailView(post: PostEntity) {
        goToDetailViewCalled = true
        self.post = post
    }

    func showAlertWith(message: String) {
        shoeAlert = true
        self.messageAlert = message
    }
}
