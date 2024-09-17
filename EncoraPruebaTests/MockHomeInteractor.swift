
import Foundation
@testable import EncoraPrueba

class MockHomeInteractor: HomeInteractorInputProtocol {
    
    var presenter: HomeInteractorOutputProtocol?
    
    var loadCountriesCalled = false

    func loadCountries() {
        loadCountriesCalled = true
    }
}
