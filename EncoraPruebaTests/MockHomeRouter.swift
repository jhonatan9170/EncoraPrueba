
import Foundation
@testable import EncoraPrueba

class MockHomeRouter: HomeWireframeProtocol {
    var goToDetailViewCalled = false
    var shoeAlert = false
    var messageAlert = ""
    var country: CountryModel?
    func goToDetailView(country: CountryModel) {
        goToDetailViewCalled = true
        self.country = country
    }

    func showAlertWith(message: String) {
        shoeAlert = true
        self.messageAlert = message
    }
}
