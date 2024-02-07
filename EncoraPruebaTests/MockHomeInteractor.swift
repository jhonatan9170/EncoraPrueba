
import Foundation
@testable import EncoraPrueba

class MockHomeInteractor: HomeInteractorInputProtocol {
    var presenter: HomeInteractorOutputProtocol?
    
    var loadPostCalled = false

    func loadPost() {
        loadPostCalled = true
    }
}
