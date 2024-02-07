
import Foundation
@testable import EncoraPrueba

class MockHomeView: HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    
    var showPostsCalled = false

    func showPosts() {
        showPostsCalled = true
    }
}
